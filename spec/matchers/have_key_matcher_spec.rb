require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe 'have_key' do
  subject do
    Article.new
  end
  
  describe 'messages' do

    it 'should contain a description' do
      matcher = have_key(:title, :type => String)
      matcher.description.should == 'have key(s) title'
    end

    it 'should set has_key? message' do
      matcher = have_key(:owner, :type => String)
      matcher.matches?(subject)
      matcher.failure_message.should == 'Expected Article to have key named owner with type String'
    end

  end
  
  describe 'matchers' do
    it { should have_key(:title, :type => String) }
    it { should have_keys(:title, :body, :type => String) }
  end

  describe 'macros' do
    should_have_key :title, :type => String
    should_have_keys :title, :body, :type => String
  end
end