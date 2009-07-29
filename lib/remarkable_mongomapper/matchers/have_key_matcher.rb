module Remarkable
  module MongoMapper
    module Matchers
      class HaveKeyMatcher < Remarkable::MongoMapper::Base #:nodoc:
        
        arguments :collection => :attributes, :as => :attribute
        
        optional :type
        
        default_options :type => nil
        
        collection_assertions :has_key?
        
        before_assert do
          @type = @options[:type]
        end

        protected

          def has_key?
            @subject.reader?(@attribute) && @subject.class.keys[@attribute] == ::MongoMapper::Key.new(@attribute, @type)
          end

      end
      
      # Ensures that a key of the database actually exists.
      #
      # == Examples
      #
      #   should_have_column :name, :type => String
      #
      #   it { should have_column(:name, :type => String) }
      #   it { should have_column(:name, :phone_number, :type => String) }
      #   it { should have_column(:name).type(String) }
      #
      def have_key(*args, &block)
        HaveKeyMatcher.new(*args, &block).spec(self)
      end
      alias :have_keys :have_key

    end
  end
end