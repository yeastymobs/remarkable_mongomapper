module Remarkable
  module MongoMapper
    module Matchers
      class ValidatePresenceOfMatcher < Remarkable::MongoMapper::Base #:nodoc:
        
        arguments :collection => :keys, :as => :key

        collection_assertions :allow_nil?

        protected

          def allow_nil?
            @subject.send("#{@key}=", nil)
            !@subject.valid? && !@subject.errors.on(@key).blank?
          end

      end
      
      # Ensures that the model cannot be saved if one of the attributes listed is not present.
      #
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