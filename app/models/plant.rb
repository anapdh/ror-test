# frozen_string_literal: true

class Plant < ApplicationRecord
  before_save :set_plant_specie_name
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }

  belongs_to :property

  PLANT_SPECIES_OPTIONS = [
    'Apple',
    'Beans',
    'Broccoli',
    'Cauliflower',
    'Cabbage',
    'Carrot',
    'Corn',
    'Grape',
    'Lettuce',
    'Melon',
    'Onion',
    'Peas',
    'Potato',
    'Pumpkin',
    'Rice',
    'Spinach',
    'Squash',
    'Tomato',
    'Watermelon',
    'Other'
  ]

  def set_plant_specie_name
    property.plant_specie = name
    property.save
  end
end
