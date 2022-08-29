# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Plant, type: :model do
  let(:contact) { Contact.create(name: 'John Doe', contact_type: 'Client', email: 'example@example.com') }
  let(:property) do
    Property.create(name: 'Property 1', plantation_area: 100, plant_specie: 'Plant 1', plants_row_spacing: 10, plants_column_spacing: 10,
                    contact_id: contact.id)
  end
  let(:plant) { Plant.create(name: 'Plant 1', property_id: property.id) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(plant).to be_valid
    end

    it 'is not valid without a name' do
      plant.name = nil
      expect(plant).to_not be_valid
    end

    it 'is not valid with a name less than 3 characters' do
      plant.name = 'Pl'
      expect(plant).to_not be_valid
    end

    it 'is not valid with a name more than 25 characters' do
      plant.name = 'Plant 1 Plant 1 Plant 1 Plant 1'
      expect(plant).to_not be_valid
    end
  end

  describe 'methods' do
    describe '#set_plant_specie_name' do
      it 'sets the plant_specie name in the property' do
        plant.set_plant_specie_name
        expect(property.plant_specie).to eq(plant.name)
      end
    end
  end

  describe 'associations' do
    it 'belongs to a property' do
      expect(plant.property).to eq(property)
    end
  end
end
