class Zone < ActiveRecord::Base
  has_many :muscles
  validates :name, uniqueness: true, presence: true
  accepts_nested_attributes_for :muscles
end