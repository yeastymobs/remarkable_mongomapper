module Remarkable
  module MongoMapper
    module Matchers
      class AssociationMatcher < Remarkable::MongoMapper::Base
        arguments :type, :collection => :associations, :as => :association

        collection_assertions :association_exists?, :type_matches?

        protected

          def association_exists?
            reflection
          end

          def type_matches?
            reflection.type == @type
          end
          
          def reflection
            @reflection ||= subject_class.associations[@association]
          end
          
          def interpolation_options
            options = {}
            options[:type] = Remarkable.t(@type, :scope => matcher_i18n_scope, :default => @type.to_s.gsub("_", ""))
            
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
      # == Examples
      #
      #   should_have_many :addresses
      #
      #   it { should have_many(:addresses) }
      #
      def have_many(*associations, &block)
        AssociationMatcher.new(:many, *associations, &block).spec(self)
      end
      
      # Ensures that the many relationship exists. Will also test that the
      # associated table has the required columns.
      #
      # == Examples
      #
      #   should_belong_to :user
      #
      #   it { should belong_to(:user) }
      #
      def belong_to(*associations, &block)
        AssociationMatcher.new(:belongs_to, *associations, &block).spec(self)
      end

    end
  end
end
