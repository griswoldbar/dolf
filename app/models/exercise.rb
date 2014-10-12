class Exercise < ActiveRecord::Base
  has_and_belongs_to_many :muscles
  has_many :drills, dependent: :destroy
  validates :name, uniqueness: true, presence: true

  def muscles_list
    muscles.pluck(:name).join(", ")
  end

  def muscle_names=(names)
    if names.is_a?(String)
      names = names.split(",")
    end

    names.each do |name|
      self.muscles << Muscle.find_by_name(name)
    end
  end
end
