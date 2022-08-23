class Property < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :plantation_area, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :plant_specie, presence: true, length: { maximum: 25 }
  # validates :plants_number, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :plants_row_spacing, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :plants_column_spacing, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
