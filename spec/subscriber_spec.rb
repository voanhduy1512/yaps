require 'spec_helper'

describe Yaps::Subscriber do
  it 'it should receive the message' do
    user = User.new :name => 'John'
    expect(User.subscribe_instance).to receive(:receiver).once
    user.save
  end
end
