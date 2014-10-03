class Zone < ActiveRecord::Base
  has_many :muscles, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  accepts_nested_attributes_for :muscles
end