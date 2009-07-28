module Remarkable
  module MongoMapper
    module Matchers
      class HaveKeyMatcher < Remarkable::Base #:nodoc:
        
        arguments :collection => :keys, :as => :key
        
        optional :type
        
        default_options :type => nil
        
        collection_assertions :has_key?
        
        before_assert do
          @type = @options[:type]
        end

        protected

          def has_key?
            @subject.reader?(@key) && @subject.class.keys[@key] == ::MongoMapper::Key.new(@key, @type)
          end

      end

      def have_key(*args, &block)
        HaveKeyMatcher.new(*args, &block).spec(self)
      end
      alias :have_keys :have_key

    end
  end
end