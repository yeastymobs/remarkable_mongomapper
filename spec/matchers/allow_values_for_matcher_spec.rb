require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe 'allow_values_for' do
  subject do
    Site.new
  end

  describe 'messages' do
    before(:each){ @model = subject; @matcher = allow_values_for(:title) }

    it 'should contain a description' do
      @matcher = allow_values_for(:title, "X", "Y", "Z")
      @matcher.description.should == 'allow "X", "Y", and "Z" as values for title'
    end

    it 'should set is_valid? message' do
      @matcher.in("A").matches?(subject)
      @matcher.failure_message.should == 'Expected Site to be valid when title is set to "A"'
    end

    it 'should set allow_nil? message' do
      @matcher.allow_nil.matches?(subject)
      @matcher.failure_message.should == 'Expected Site to allow nil values for title'
    end

    it 'should set allow_blank? message' do
      @matcher.allow_blank.matches?(subject)
      @matcher.failure_message.should == 'Expected Site to allow blank values for title'
    end
  end

  describe 'matchers' do
    it { should allow_values_for(:title).in('X', 'Y', 'Z') }
    it { should_not allow_values_for(:title).in('A') }
  
    # it { should define_and_validate(:with => /X|Y|Z/, :message => 'valid').in('X', 'Y', 'Z').message('valid') }
  
    # create_optional_boolean_specs(:allow_nil, self, :with => /X|Y|Z/)
    # create_optional_boolean_specs(:allow_blank, self, :with => /X|Y|Z/)
  end
  
  describe 'macros' do
    should_allow_values_for :title, 'X'
    should_not_allow_values_for :title, 'A'
  end
  
  describe 'failures' do
    it "should fail if any of the values are valid on invalid cases" do
      lambda {
        should_not allow_values_for :title, 'A', 'X', 'B'
      }.should raise_error(Spec::Expectations::ExpectationNotMetError, /Did not expect Site to be valid/)
    end
  end
end

