class Muscle < ActiveRecord::Base
  belongs_to :zone
  has_and_belongs_to_many :exercises
  validates :name, uniqueness: true, presence: true

end