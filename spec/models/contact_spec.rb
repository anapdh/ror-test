# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  let(:contact) { Contact.new(name: 'John Doe', contact_type: 'Client', email: 'client@example.com') }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(contact).to be_valid
    end

    it 'is not valid without a name' do
      contact.name = nil
      expect(contact).to_not be_valid
    end

    it 'is not valid without a contact_type' do
      contact.contact_type = nil
      expect(contact).to_not be_valid
    end

    it 'is not valid without a email' do
      contact.email = nil
      expect(contact).to_not be_valid
    end

    it 'is not valid with a name less than 3 characters' do
      contact.name = 'Jo'
      expect(contact).to_not be_valid
    end

    it 'is not valid with a name more than 25 characters' do
      contact.name = 'John Doe John Doe John Doe'
      expect(contact).to_not be_valid
    end

    it 'is not valid with a contact_type different than Client or Provider' do
      contact.contact_type = 'Other'
      expect(contact).to_not be_valid

      contact.contact_type = 'Client'
      expect(contact).to be_valid

      contact.contact_type = 'Provider'
      expect(contact).to be_valid
    end

    it 'is not valid with a email that is not a valid email' do
      contact.email = 'clientexample.com'
      expect(contact).to_not be_valid
    end

    it 'is not valid with a email that is not unique' do
      Contact.create(name: 'Client1', contact_type: 'Client', email: 'client@example.com')
      expect(contact).to_not be_valid
    end

    it 'is not valid with more than 3 properties' do
      contact.properties.build(name: 'Property 1', plantation_area: 100, plants_row_spacing: 10,
                               plants_column_spacing: 10)
      contact.properties.build(name: 'Property 2', plantation_area: 100, plants_row_spacing: 10,
                               plants_column_spacing: 10)
      contact.properties.build(name: 'Property 3', plantation_area: 100, plants_row_spacing: 10,
                               plants_column_spacing: 10)
      contact.properties.build(name: 'Property 4', plantation_area: 100, plants_row_spacing: 10,
                               plants_column_spacing: 10)
      expect(contact).to_not be_valid
    end
  end

  describe 'methods' do
    describe '#provider?' do
      it 'is a provider' do
        contact.contact_type = 'Provider'
        expect(contact.provider?).to be true
      end

      it 'is not a provider' do
        contact.contact_type = 'Client'
        expect(contact.provider?).to be false
      end
    end
  end

  describe 'associations' do
    it 'has many properties' do
      assc = described_class.reflect_on_association(:properties)
      expect(assc.macro).to eq :has_many
    end
  end

  describe 'nested attributes' do
    let(:contact_with_properties) do
      Contact.new(name: 'John Doe', contact_type: 'Client', email: 'client@example.com',
                  properties_attributes: [{ name: 'Property 1', plantation_area: 100,
                                            plants_row_spacing: 10, plants_column_spacing: 10 }])
    end

    it 'accepts nested attributes for properties' do
      expect(contact_with_properties).to be_valid
    end
  end
end
