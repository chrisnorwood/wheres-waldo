class Area < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  # validates :parent_id, presence: true

  belongs_to :user

  belongs_to :parent, class_name: 'Area', optional: true
  has_many :children, class_name: 'Area', foreign_key: 'parent_id'

  has_many :climbs

  has_many :ratings, as: :rateable
  has_many :comments, as: :commentable

end
