require 'spec_helper'

describe Yaps::Publisher do
  describe 'active record' do
    describe 'when a model was created ' do
      it "it should call publish" do
        user = User.new(:name => 'John')
        expect(user).to receive(:publish).once.with(:user_created, user)
        user.save
      end
    end

    describe 'when a model was updated ' do
      it "it should call publish" do
        user = User.create(:name => 'John')
        user.name = 'Jack'
        expect(user).to receive(:publish).once.with(:user_updated, user)
        user.save
      end
    end

    describe 'when a model was deleted ' do
      it "it should call publish" do
        user = User.create(:name => 'John')
        expect(user).to receive(:publish).once.with(:user_deleted, user)
        user.destroy
      end
    end
  end

  describe '.publish' do
    context 'Yaps is disable' do
      it "should not publish message" do
        Yaps.configuration.enable = false
        user = User.create(:name => 'John')
        expect(user.send(:publish, :user_created, user)).to eq(false)
      end
    end

    context 'Yaps is enable' do
      it "should publish message" do
        Yaps.configuration.enable = true
        user = User.create(:name => 'John')
        expect(user.send(:publish, :user_created, user)).not_to eq(false)
      end
    end
  end
end
