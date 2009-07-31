require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe 'validate_confirmation_of' do
  include ModelBuilder

  # Defines a model, create a validation and returns a raw matcher
  def define_and_validate(options={})
    @model = define_model :person do
      include MongoMapper::Document
      
      key :name, String
      key :email, String
      key :age, String
      
      validates_confirmation_of :name, :email, options
    end

    validate_confirmation_of(:name, :email)
  end

  describe 'messages' do
    before(:each){ @matcher = define_and_validate }

    it 'should contain a description' do
      @matcher.description.should == 'require name and email to be confirmed'
    end

    it 'should set responds_to_confirmation? message' do
      @matcher = validate_confirmation_of(:age)
      @matcher.matches?(@model)
      @matcher.failure_message.should == 'Expected Person instance responds to age_confirmation'
    end

    it 'should set confirms? message' do
      @model.instance_eval{ def age_confirmation=(*args); end }
      @matcher = validate_confirmation_of(:age)
      @matcher.matches?(@model)
      @matcher.failure_message.should == 'Expected Person to be valid only when age is confirmed'
    end

  end

  describe 'matchers' do

    describe 'without options' do
      before(:each){ define_and_validate }

      it { should validate_confirmation_of(:name) }
      it { should validate_confirmation_of(:name, :email) }
      it { should_not validate_confirmation_of(:name, :age) }
    end

    create_message_specs(self)
  end

  describe 'macros' do
    before(:each){ define_and_validate }

    should_validate_confirmation_of :name
    should_validate_confirmation_of :name, :email
    should_not_validate_confirmation_of :name, :age
  end

end
