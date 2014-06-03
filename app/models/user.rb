class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :own_events, :class_name => "Event"

  has_many :interests, :dependent => :destroy
  has_many :genres, :through => :interests
  has_many :taggings, :through => :genres
  has_many :interested_events, :through => :taggings, :source => :event
  has_many :favorite_genres, :through => :interests, :source => :genre

end
