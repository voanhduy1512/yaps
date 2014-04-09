require 'spec_helper'

describe Yaps::Publisher do
  describe 'messages' do
    it "it should fired a message after create" do
      user = User.new(:name => 'John')
      expect(user).to receive(:publish).once.with(:user_created, user)
      user.save
    end

    it "it should fired a message after update" do
      user = User.create(:name => 'John')
      user.name = 'Jack'
      expect(user).to receive(:publish).once.with(:user_updated, user)
      user.save
    end

    it "it should fired a message after update" do
      user = User.create(:name => 'John')
      expect(user).to receive(:publish).once.with(:user_deleted, user)
      user.destroy
    end
  end
end
