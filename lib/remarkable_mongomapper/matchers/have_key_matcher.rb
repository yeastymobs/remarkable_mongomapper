module Remarkable
  module MongoMapper
    module Matchers
      class HaveKeyMatcher < Remarkable::MongoMapper::Base
        
        arguments :type, :collection => :attributes, :as => :attribute
        
        collection_assertions :has_key?
        
        # before_assert do
        #   @type = @options[:type]
        # end

        protected

          def has_key?
            @subject.respond_to?(@attribute) && @subject.class.keys[@attribute] == ::MongoMapper::Key.new(@attribute, @type)
          end

      end
      
      # Ensures that a key of the database actually exists.
      #
      # == Examples
      #
      #   should_have_key :name, String
      #
      #   it { should have_key(:name, String) }
      #   it { should have_keys(:name, :phone_number, String) }
      #
      def have_key(*args, &block)
        HaveKeyMatcher.new(args.pop, *args, &block).spec(self)
      end
      alias :have_keys :have_key

    end
  end
end