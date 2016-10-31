require 'rails_helper'

RSpec.describe DareSubmission, type: :model do
  
  subject { FactoryGirl.build(:dare_submission) }
  
  before do
   
  end

  it "is not valid without a user_id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a dare_id" do
    subject.dare_id = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without content" do
    subject.content = ""
    expect(subject).to_not be_valid
  end
  
  it "is not valid without description" do
    subject.description = " "
    expect(subject).to_not be_valid
  end
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
end
