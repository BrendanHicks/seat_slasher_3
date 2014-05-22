class Event < ActiveRecord::Base

  belongs_to :region
  belongs_to :user
  has_many :taggings
  has_many :genres, :through => :taggings
  has_many :interested_users, :through => :genres, :source => :users

#   before_save :update_discount

#   def update_discount
#     self.discount =
#   end
end
