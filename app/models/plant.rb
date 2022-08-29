# frozen_string_literal: true

class Plant < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }

  belongs_to :property
end
