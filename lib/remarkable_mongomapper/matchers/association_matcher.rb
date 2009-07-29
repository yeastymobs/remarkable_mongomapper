module Remarkable
  module MongoMapper
    module Matchers
      class AssociationMatcher < Remarkable::MongoMapper::Base
        arguments :type, :collection => :associations, :as => :association
        
        optionals :class_name

        collection_assertions :association_exists?, :type_matches?, :klass_exists?, :options_match?

        protected

          def association_exists?
            reflection
          end

          def type_matches?
            reflection.type == @type
          end
          
          def klass_exists?
            return true if @options[:polymorphic]
            reflection.klass rescue nil
          end
          
          def options_match?
            actual_options = {}

            @options.keys.each do |key|
              method = :"reflection_#{key}"

              @options[key]       = @options[key].to_s
              actual_options[key] = (respond_to?(method, true) ? send(method) : reflection.options[key]).to_s
            end

            return @options == actual_options, :actual => actual_options.inspect
          end
        
        private
          
          def reflection
            @reflection ||= subject_class.associations[@association]
          end
          
          def interpolation_options
            options = {}
            options[:type] = Remarkable.t(@type, :scope => matcher_i18n_scope, :default => @type.to_s.gsub("_", ""))
            options[:options] = @options.inspect
            
            if @subject && reflection
              options.merge!(
                :actual_type => Remarkable.t(reflection.type, :scope => matcher_i18n_scope, :default => reflection.type.to_s)
              )
            end
            
            options
          end

      end

      # Ensures that the many relationship exists. Will also test that the
      # associated table has the required columns.
      #
      # == Options
      #
      # * <tt>:class_name</tt> - the expected associted class name.
      # * <tt>:polymorphic</tt> - if the association should be polymorphic or not.
      #   When true it also checks for the association_type column in the subject table.
      #
      # == Examples
      #
      #   should_have_many :addresses
      #   should_have_many :users, :class_name => 'Person'
      #
      #   it { should have_many(:addresses) }
      #   it { should have_many(:users, :class_name => 'Person') }
      #
      def have_many(*associations, &block)
        AssociationMatcher.new(:many, *associations, &block).spec(self)
      end
      
      # Ensures that the many relationship exists. Will also test that the
      # associated table has the required columns.
      #
      # == Options
      #
      # * <tt>:class_name</tt> - the expected associted class name.
      # * <tt>:polymorphic</tt> - if the association should be polymorphic or not.
      #   When true it also checks for the association_type column in the subject table.
      #
      # == Examples
      #
      #   should_belong_to :user
      #   should_belong_to :user, :class_name => 'Person'
      #
      #   it { should belong_to(:user) }
      #   it { should belong_to(:user, :class_name => 'Person') }
      #
      def belong_to(*associations, &block)
        AssociationMatcher.new(:belongs_to, *associations, &block).spec(self)
      end

    end
  end
end
