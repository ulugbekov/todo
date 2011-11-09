class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"
  
  after_create :add_friend
  after_destroy :remove_friend
  
  
  
  def add_friend
  friend.friends << user unless friend.friends.include?(user)
  end
  
  
  def remove_friend
  friend.friends.delete(user)
  end
  
  
  
  
end
