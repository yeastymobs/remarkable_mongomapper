require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe 'validate_presence_of' do
  subject do
    Article.new
  end
  
  describe 'messages' do
    
    it 'should contain a description' do
      matcher = validate_presence_of(:title, :body)
      matcher.description.should == 'require title and body to be set'
    end

    it 'should set allow_nil? message' do
      matcher = validate_presence_of(:body)
      matcher.matches?(subject)
      matcher.failure_message.should == 'Expected Article to require body to be set'
      matcher.negative_failure_message.should == 'Did not expect Article to require body to be set'
    end
    
  end

  describe 'matchers' do
    it { should validate_presence_of(:title) }
    it { should_not validate_presence_of(:body) }
  end

  describe 'macros' do
    should_validate_presence_of(:title)
    should_not_validate_presence_of(:body)
  end
end