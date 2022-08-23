class Contact < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :contact_type, presence: true, inclusion: { in: ['Client', 'Provider'] }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  CONTACT_OPTIONS = [
    ['Client', 'Client'],
    ['Provider', 'Provider']
  ].freeze
end
