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

      def validate_presence_of(*args, &block)
        ValidatePresenceOfMatcher.new(*args, &block).spec(self)
      end

    end
  end
end