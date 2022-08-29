require 'rails_helper'

RSpec.describe Property, type: :model do
  let(:contact) { Contact.create(name: 'John Doe', contact_type: 'Client', email: 'examplle@example.com') }
  let(:property) { Property.new(name: 'Property 1', plantation_area: 100, plants_row_spacing: 10, plants_column_spacing: 10, contact_id: contact.id) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(property).to be_valid
    end

    it 'is not valid without a name' do
      property.name = nil
      expect(property).to_not be_valid
    end

    it 'is not valid without a plantation_area' do
      property.plantation_area = nil
      expect(property).to_not be_valid
    end

    it 'is not valid without a plants_row_spacing' do
      property.plants_row_spacing = nil
      expect(property).to_not be_valid
    end

    it 'is not valid without a plants_column_spacing' do
      property.plants_column_spacing = nil
      expect(property).to_not be_valid
    end

    it 'is not valid with a name less than 3 characters' do
      property.name = 'Pr'
      expect(property).to_not be_valid
    end

    it 'is not valid with a name more than 25 characters' do
      property.name = 'Property 1 Property 1 Property 1'
      expect(property).to_not be_valid
    end

    it 'is not valid with a plantation_area less than 1' do
      property.plantation_area = 0
      expect(property).to_not be_valid
    end

    it 'is not valid with a plants_row_spacing less than 1' do
      property.plants_row_spacing = 0
      expect(property).to_not be_valid
    end

    it 'is not valid with a plants_column_spacing less than 1' do
      property.plants_column_spacing = 0
      expect(property).to_not be_valid
    end

    it 'is not valid with a plantation_area that is not an integer' do
      property.plantation_area = 100.5
      expect(property).to_not be_valid
    end

    it 'is not valid with a plants_row_spacing that is not an integer' do
      property.plants_row_spacing = 10.5
      expect(property).to_not be_valid
    end

    it 'is not valid with a plants_column_spacing that is not an integer' do
      property.plants_column_spacing = 10.5
      expect(property).to_not be_valid
    end

    it 'is not valid with a plantation_area that is not a number' do
      property.plantation_area = 'abc'
      expect(property).to_not be_valid
    end

    it 'is not valid with a plants_row_spacing that is not a number' do
      property.plants_row_spacing = 'abc'
      expect(property).to_not be_valid
    end

    it 'is not valid with a plants_column_spacing that is not a number' do
      property.plants_column_spacing = 'abc'
      expect(property).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a contact' do
      assc = described_class.reflect_on_association(:contact)
      expect(assc.macro).to eq :belongs_to
    end

    it 'has many plantations' do
      assc = described_class.reflect_on_association(:plants)
      expect(assc.macro).to eq :has_many
    end
  end

  describe 'methods' do
    describe '#plants_number_calc' do
      it 'returns the number of plants' do
        expect(property.plants_number_calc).to eq 1
      end
    end

    describe '#set_properties_max' do
      it 'has a max of 3 properties per contact' do
        contact.properties.create(name: 'Property 1', plantation_area: 100, plants_row_spacing: 10, plants_column_spacing: 10)
        contact.properties.create(name: 'Property 2', plantation_area: 100, plants_row_spacing: 10, plants_column_spacing: 10)
        contact.properties.create(name: 'Property 3', plantation_area: 100, plants_row_spacing: 10, plants_column_spacing: 10)
        property4 = contact.properties.create(name: 'Property 4', plantation_area: 100, plants_row_spacing: 10, plants_column_spacing: 10)
        expect(property4.errors.messages).to eq(:base => ["You can only have 3 properties per contact"])
      end
    end
  end

  describe 'nested attributes' do
    let(:property_with_plants) { Property.new(name: 'Property 1', plantation_area: 100, plants_row_spacing: 10, plants_column_spacing: 10, contact_id: contact.id,
      plants_attributes: [{ name: 'PlantSpecie' }])
    }

    it 'accepts nested attributes for properties' do
      expect(property_with_plants).to be_valid
    end
  end
end
