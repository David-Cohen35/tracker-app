require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "validations" do
    context "should validate presence of username" do
      it { should validate_presence_of(:username) } #"checks the presence of a username"
    end
    context "should validate presence of password_digest" do
      it { should validate_presence_of(:password_digest) } #"checks the presense of a password"
    end
    context "should validate presence of password" do
      it { should validate_length_of(:password).is_at_least(6) } #"raises an error if password is less than 6 characters"
    end
  end

  describe "associations" do
    it { should have_many(:goals) } #Need goal_id, #comment_id
    it { should have_many(:comments) }
  end


  describe "uniqueness" do
    before :each do 
      create :user
    end
    
    it "should validate uniqueness of username" do
      it { should validate_uniqueness_of(:username) } #"checks the uniqueness of the username"
    end
    
    it "should validate uniqueness of session_token" do 
      it { should validate_uniqueness_of(:session_token) } #"checks the uniqueness of the username"
    end
  end

  describe "self.find_by_credentials" do
    let!(:user) { create :user }   #Must immediately create dummy to test
    context "with an existing username" do
      it "should return the user" do
        expect(self.find_by_credentials(:username, :password)).to eq(:user)
      end
    end

    context "with a non-existing username" do
      it "should return nil" do
        expect(self.find_by_credentials(nil, :password)).to be nil
      end
    end
  end
end