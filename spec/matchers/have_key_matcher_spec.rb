require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe 'have_key' do
  subject do
    Article.new
  end
  
  describe 'messages' do

    it 'should contain a description' do
      matcher = have_key(:title)
      matcher.description.should == 'have keys title'
    end

    it 'should set has_key? message' do
      matcher = have_key(:owner)
      matcher.matches?(subject)
      matcher.failure_message.should == 'Expected Article to have key named owner'
    end

  end
  
  describe 'matchers' do
    it { should have_key(:title) }
    it { should have_keys(:title, :body) }
  end

  describe 'macros' do
    should_have_key :title
    should_have_keys :title, :body
  end
end