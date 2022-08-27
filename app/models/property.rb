class Property < ApplicationRecord
  before_save :plants_number_calc
  before_create :set_properties_max

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :plantation_area, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :plants_row_spacing, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :plants_column_spacing, presence: true, numericality: { only_integer: true, greater_than: 0 }

  belongs_to :contact

  has_many :plants, dependent: :destroy
  accepts_nested_attributes_for :plants, allow_destroy: true

  def plants_number_calc
    calc = (plantation_area / (plants_row_spacing * plants_column_spacing)).to_i
    self.plants_number = calc
  end

  def set_properties_max
    if self.contact.properties.count >= 3
      errors.add(:base, "Limit of properties is 3")
      throw(:abort)
    end
  end
end
