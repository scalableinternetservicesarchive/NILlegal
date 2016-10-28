require 'rails_helper'

RSpec.describe DareSubmission, type: :model do
  
  subject { described_class.new }
  
  before do
        
  end
  
  it "is not valid without a user_id" do
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a dare_id" do
    expect(subject).to_not be_valid
  end
  
  it "is not valid without content" do
    expect(subject).to_not be_valid
  end
  
  it "is valid with valid attributes" do
    user = FactoryGirl.create(:user)
    dare = user.dares.build(title: "Test", description: "Test dare")
    dare.save
    user2 = FactoryGirl.create(:user2)
    dare_sub = dare.dare_submissions.build(content: "test")
    user2.dare_submissions << dare_sub
    #dare_sub = dare.new(content: "Test")
    #user << dare_sub
    
    #subject.user_id = user.id
    #subject.dare_id = dare.id
    #subject.content = "Test"
    expect(dare).to be_valid
  end
end
