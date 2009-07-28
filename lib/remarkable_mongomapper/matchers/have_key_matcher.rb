module Remarkable
  module MongoMapper
    module Matchers
      class HaveKeyMatcher < Remarkable::Base #:nodoc:
        
        arguments :collection => :keys, :as => :key
        
        collection_assertions :has_key?

        protected

          def has_key?
            @subject.respond_to?(@key) && @subject.respond_to?("#{@key}=")
          end

      end

      def have_key(*args, &block)
        HaveKeyMatcher.new(*args, &block).spec(self)
      end
      alias :have_keys :have_key

    end
  end
end