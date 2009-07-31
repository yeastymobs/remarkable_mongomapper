module Remarkable
  module MongoMapper
    module Matchers
      class ValidateLengthOfMatcher < Remarkable::MongoMapper::Base #:nodoc:
        arguments :collection => :attributes, :as => :attribute

        optional :within, :minimum, :maximum, :is
        optional :allow_nil, :allow_blank, :default => true
        optional :message
        
        default_options :message => "is invalid"

        collection_assertions :less_than_min_length?, :exactly_min_length?,
                              :more_than_max_length?, :exactly_max_length?,
                              :allow_nil?, :allow_blank?

        before_assert do
          if @options[:is]
            @min_value, @max_value = @options[:is], @options[:is]
          elsif @options[:within]
            @min_value, @max_value = @options[:within].first, @options[:within].last
          elsif @options[:maximum]
            @min_value, @max_value = nil, @options[:maximum]
          elsif @options[:minimum]
            @min_value, @max_value = @options[:minimum], nil
          end
        end

        protected
          def allow_nil?
            super(default_message_for(:too_short))
          end

          def allow_blank?
            super(default_message_for(:too_short))
          end

          def less_than_min_length?
            @min_value.nil? || @min_value <= 1 || bad?(@min_value - 1, default_message_for(:too_short))
          end

          def exactly_min_length?
            @min_value.nil? || @min_value <= 0 || good?(@min_value, default_message_for(:too_short))
          end

          def more_than_max_length?
            @max_value.nil? || bad?(@max_value + 1, default_message_for(:too_long))
          end

          def exactly_max_length?
            @max_value.nil? || @min_value == @max_value || good?(@max_value, default_message_for(:too_long))
          end

          def interpolation_options
            { :minimum => @min_value, :maximum => @max_value }
          end

          # Returns the default message for the validation type.
          # If user supplied :message, it will return it. Otherwise it will return
          # wrong_length on :is validation and :too_short or :too_long in the other
          # types.
          #
          def default_message_for(validation_type)
            return :message if @options[:message]
          end
      end

      # Validates the length of the given attributes. You have also to supply
      # one of the following options: minimum, maximum, is or within.
      #
      # Note: this method is also aliased as <tt>validate_size_of</tt>.
      #
      # == Options
      #
      # * <tt>:minimum</tt> - The minimum size of the attribute.
      # * <tt>:maximum</tt> - The maximum size of the attribute.
      # * <tt>:is</tt> - The exact size of the attribute.
      # * <tt>:within</tt> - A range specifying the minimum and maximum size of the attribute.
      # * <tt>:allow_nil</tt> - when supplied, validates if it allows nil or not.
      # * <tt>:allow_blank</tt> - when supplied, validates if it allows blank or not.
      # * <tt>:message</tt> - value the test expects to find in <tt>errors.on(:attribute)</tt>.
      #   Regexp, string or symbol. Default = "is invalid"</tt>
      #
      # == Examples
      #
      #   it { should validate_length_of(:password).within(6..20) }
      #   it { should validate_length_of(:password).maximum(20) }
      #   it { should validate_length_of(:password).minimum(6) }
      #   it { should validate_length_of(:age).is(18) }
      #
      #   should_validate_length_of :password, :within => 6..20
      #   should_validate_length_of :password, :maximum => 20
      #   should_validate_length_of :password, :minimum => 6
      #   should_validate_length_of :age, :is => 18
      #
      #   should_validate_length_of :password do |m|
      #     m.minimum 6
      #     m.maximum 20
      #   end
      #
      def validate_length_of(*attributes, &block)
        ValidateLengthOfMatcher.new(*attributes, &block).spec(self)
      end
    end
  end
end
