class Property < ApplicationRecord
  before_save :plants_number_calc

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :plantation_area, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :plant_specie, presence: true, length: { maximum: 25 }
  validates :plants_row_spacing, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :plants_column_spacing, presence: true, numericality: { only_integer: true, greater_than: 0 }

  belongs_to :contact, dependent: :destroy

  def plants_number_calc
    calc = (plantation_area / (plants_row_spacing * plants_column_spacing)).to_i
    self.plants_number = calc
  end
end
