class Tagging < ActiveRecord::Base

  validates :event_id, uniqueness: {scope: :genre_id, message: "This event has already been assigned into this genre."}

  belongs_to :event
  belongs_to :genre



end
