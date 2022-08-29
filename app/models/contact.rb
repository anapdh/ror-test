# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :contact_type, presence: true, inclusion: { in: %w[Client Provider] }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :properties, dependent: :destroy
  validates :properties, length: { maximum: 3 }
  accepts_nested_attributes_for :properties, allow_destroy: true

  CONTACT_OPTIONS = [
    %w[Client Client],
    %w[Provider Provider]
  ].freeze

  def provider?
    contact_type == 'Provider'
  end
end
