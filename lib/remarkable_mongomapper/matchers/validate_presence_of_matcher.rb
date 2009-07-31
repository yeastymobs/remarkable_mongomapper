module Remarkable
  module MongoMapper
    module Matchers
      class ValidatePresenceOfMatcher < Remarkable::MongoMapper::Base
        arguments :collection => :attributes, :as => :attribute
        optional  :message

        collection_assertions :allow_nil?
        default_options :message => "can't be empty"

        protected

          def allow_nil?
            bad?(nil, :message)
          end

      end
      
      # Ensures that the model cannot be saved if one of the attributes listed is not present.
      #
      # == Options
      #
      # * <tt>:message</tt> - value the test expects to find in <tt>errors.on(:attribute)</tt>.
      #   Regexp, string or symbol. Default = "can't be empty"
      #
      # == Examples
      #
      #   should_validate_presence_of :name, :phone_number
      #   it { should validate_presence_of(:name, :phone_number) }
      #
      def validate_presence_of(*args, &block)
        ValidatePresenceOfMatcher.new(*args, &block).spec(self)
      end

    end
  end
end