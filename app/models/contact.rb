class Contact < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :contact_type, presence: true, inclusion: { in: ['Client', 'Provider'] }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :properties, dependent: :destroy
  validates_length_of :properties, maximum: 3
  accepts_nested_attributes_for :properties, allow_destroy: true

  has_many :plants, through: :properties
  accepts_nested_attributes_for :plants, allow_destroy: true

  CONTACT_OPTIONS = [
    ['Client', 'Client'],
    ['Provider', 'Provider']
  ].freeze

  def is_provider?
    contact_type == 'Provider'
  end
end
