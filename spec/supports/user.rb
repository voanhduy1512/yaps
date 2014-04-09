class User < ActiveRecord::Base
  self.table_name = 'users'
  include Yaps::Publisher
  include Yaps::Subscriber
  subscribe :user_created, with: :receiver
  published


  def receiver user
  end
end
