require 'rails_helper'

RSpec.describe Plant, type: :model do
  let(:contact) { Contact.create(name: 'John Doe', contact_type: 'Client', email: 'example@example.com') }
  let(:property) { Property.create(name: 'Property 1', plantation_area: 100, plants_row_spacing: 10, plants_column_spacing: 10, contact_id: contact.id) }
  let(:plant) { Plant.new(name: 'Plant 1', property_id: property.id) }

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

  describe 'associations' do
    it 'belongs to a property' do
      expect(plant.property).to eq(property)
    end
  end
end


