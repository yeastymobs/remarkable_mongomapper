require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe 'association_matcher' do
  subject do
    Article.new
  end
  
  describe 'have_many' do

    describe 'messages' do
      it 'should contain a description' do
        matcher = have_many(:comments)
        matcher.description.should == 'have many comments'
      end

      it 'should set association_exists? message' do
        matcher = have_many(:whatever)
        matcher.matches?(subject)
        matcher.failure_message.should == 'Expected Article records have many whatever, but the association does not exist'
      end
      
      it 'should set type_matches? message' do
        matcher = belong_to(:comments)
        matcher.matches?(subject)
        matcher.failure_message.should == 'Expected Article records belong to comments, got Article records have many comments'
      end
    end
    
    describe 'matchers' do
      it { should have_many(:comments) }
      it { should_not belong_to(:comment) }
    end
    
    describe 'macros' do
      should_have_many :comments
      should_not_belong_to :comment
    end

  end
  
  describe 'belong_to' do

    describe 'messages' do
      it 'should contain a description' do
        matcher = belong_to(:user)
        matcher.description.should == 'belong to user'
      end

      it 'should set association_exists? message' do
        matcher = belong_to(:whatever)
        matcher.matches?(subject)
        matcher.failure_message.should == 'Expected Article records belong to whatever, but the association does not exist'
      end
      
      it 'should set type_matches? message' do
        matcher = have_many(:user)
        matcher.matches?(subject)
        matcher.failure_message.should == 'Expected Article records have many user, got Article records belong to user'
      end
    end
    
    describe 'matchers' do
      it { should belong_to(:user) }
      it { should_not have_many(:users) }
    end
    
    describe 'macros' do
      should_belong_to :user
      should_not_have_many :users
    end

  end

end
