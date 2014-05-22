class Genre < ActiveRecord::Base

  has_many :taggings
  has_many :interests
  has_many  :users, :through => :interests
  has_many  :events, :through => :taggings


end
