# frozen_string_literal: true

class Plant < ApplicationRecord
  before_save :set_plant_specie_name
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }

  belongs_to :property

  def set_plant_specie_name
    property.plant_specie = self.name
    property.save
  end
end
