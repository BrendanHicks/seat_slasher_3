class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :interests, :dependent => :destroy
  has_many :genres, :through => :intersts
  has_many :taggings, :through => :genres
  has_many :favorite_events, :through => :taggings, :source => :event
  has_many :favorite_genres, :through => :interests, :source => :genre
  has_many :favorite_taggings, :through => :favorite_genres, :source => :tagging
  has_many :taggins, :through => :genres, :dependent => :destroy

end
