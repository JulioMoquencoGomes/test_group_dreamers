require 'rails_helper'

RSpec.describe "TouristSpot", type: :model do
  context 'validations' do

    it 'is valid with valid attributes' do
        tourist_spot = TouristSpot.new(name: "New York", 
        city: "New York",
        state: "New York",
        country: "USA",
        xid: "xid_test",
        kinds: "restaurant, tourist spot, hotels, places",
        image: "",
        url: "",
        description: "New Yorkers relied on several varieties of transportation: ferries between Brooklyn and lower Manhattan.",
        coordenates: "lat: 40.730610, lon: -73.935242")
      expect(tourist_spot).to be_valid
    end

    it 'is not valid without a name' do
        tourist_spot = TouristSpot.new(name: nil, 
        city: "New York",
        state: "New York",
        country: "USA",
        xid: "xid_test",
        kinds: "restaurant, tourist spot, hotels, places",
        image: "",
        url: "",
        description: "New Yorkers relied on several varieties of transportation: ferries between Brooklyn and lower Manhattan.",
        coordenates: "lat: 40.730610, lon: -73.935242")
      expect(tourist_spot).not_to be_valid
    end

    it 'is not valid without a city' do
        tourist_spot = TouristSpot.new(name: "New York", 
        city: nil,
        state: "New York",
        country: "USA",
        xid: "xid_test",
        kinds: "restaurant, tourist spot, hotels, places",
        image: "",
        url: "",
        description: "New Yorkers relied on several varieties of transportation: ferries between Brooklyn and lower Manhattan.",
        coordenates: "lat: 40.730610, lon: -73.935242")
      expect(tourist_spot).not_to be_valid
    end

    it 'is not valid without a state' do
        tourist_spot = TouristSpot.new(name: "New York", 
        city: "New York",
        state: nil,
        country: "USA",
        xid: "xid_test",
        kinds: "restaurant, tourist spot, hotels, places",
        image: "",
        url: "",
        description: "New Yorkers relied on several varieties of transportation: ferries between Brooklyn and lower Manhattan.",
        coordenates: "lat: 40.730610, lon: -73.935242")
      expect(tourist_spot).not_to be_valid
    end

    it 'is not valid without a country' do
        tourist_spot = TouristSpot.new(name: "New York", 
        city: "New York",
        state: "New York",
        country: nil,
        xid: "xid_test",
        kinds: "restaurant, tourist spot, hotels, places",
        image: "",
        url: "",
        description: "New Yorkers relied on several varieties of transportation: ferries between Brooklyn and lower Manhattan.",
        coordenates: "lat: 40.730610, lon: -73.935242")
      expect(tourist_spot).not_to be_valid
    end

    it 'is not valid without a xid' do
        tourist_spot = TouristSpot.new(name: "New York", 
        city: "New York",
        state: "New York",
        country: "USA",
        xid: nil,
        kinds: "restaurant, tourist spot, hotels, places",
        image: "",
        url: "",
        description: "New Yorkers relied on several varieties of transportation: ferries between Brooklyn and lower Manhattan.",
        coordenates: "lat: 40.730610, lon: -73.935242")
      expect(tourist_spot).not_to be_valid
    end

    it 'is not valid without a description' do
        tourist_spot = TouristSpot.new(name: "New York", 
        city: "New York",
        state: "New York",
        country: "USA",
        xid: "xid_test",
        kinds: "restaurant, tourist spot, hotels, places",
        image: "",
        url: "",
        description: nil,
        coordenates: "lat: 40.730610, lon: -73.935242")
      expect(tourist_spot).not_to be_valid
    end

    it 'is not valid without a coordenates' do
        tourist_spot = TouristSpot.new(name: "New York", 
        city: "New York",
        state: "New York",
        country: "USA",
        xid: "xid_test",
        kinds: "restaurant, tourist spot, hotels, places",
        image: "",
        url: "",
        description: "New Yorkers relied on several varieties of transportation: ferries between Brooklyn and lower Manhattan.",
        coordenates: nil)
      expect(tourist_spot).not_to be_valid
    end
  end

  context 'saving' do
    it 'saves successfully with valid attributes' do
      tourist_spot = TouristSpot.new(name: "New York", 
      city: "New York",
      state: "New York",
      country: "USA",
      xid: "xid_test",
      kinds: "restaurant, tourist spot, hotels, places",
      image: "",
      url: "",
      description: "New Yorkers relied on several varieties of transportation: ferries between Brooklyn and lower Manhattan.",
      coordenates: "lat: 40.730610, lon: -73.935242")
      expect { tourist_spot.save }.to change { TouristSpot.count }.by(1)
    end

    it 'does not save without a name' do
        tourist_spot = TouristSpot.new(name: nil, 
        city: "New York",
        state: "New York",
        country: "USA",
        xid: "xid_test",
        kinds: "restaurant, tourist spot, hotels, places",
        image: "",
        url: "",
        description: "New Yorkers relied on several varieties of transportation: ferries between Brooklyn and lower Manhattan.",
        coordenates: "lat: 40.730610, lon: -73.935242")
      expect { tourist_spot.save }.not_to change { TouristSpot.count }
    end

    it 'does not save without a city' do
        tourist_spot = TouristSpot.new(name: "New York", 
        city: nil,
        state: "New York",
        country: "USA",
        xid: "xid_test",
        kinds: "restaurant, tourist spot, hotels, places",
        image: "",
        url: "",
        description: "New Yorkers relied on several varieties of transportation: ferries between Brooklyn and lower Manhattan.",
        coordenates: "lat: 40.730610, lon: -73.935242")
      expect { tourist_spot.save }.not_to change { TouristSpot.count }
    end

    it 'does not save without a state' do
        tourist_spot = TouristSpot.new(name: "New York",
        city: "New York",
        state: nil,
        country: "USA",
        xid: "xid_test",
        kinds: "restaurant, tourist spot, hotels, places",
        image: "",
        url: "",
        description: "New Yorkers relied on several varieties of transportation: ferries between Brooklyn and lower Manhattan.",
        coordenates: "lat: 40.730610, lon: -73.935242")
      expect { tourist_spot.save }.not_to change { TouristSpot.count }
    end

    it 'does not save without a country' do
        tourist_spot = TouristSpot.new(name: "New York", 
        city: "New York",
        state: "New York",
        country: nil,
        xid: "xid_test",
        kinds: "restaurant, tourist spot, hotels, places",
        image: "",
        url: "",
        description: "New Yorkers relied on several varieties of transportation: ferries between Brooklyn and lower Manhattan.",
        coordenates: "lat: 40.730610, lon: -73.935242")
      expect { tourist_spot.save }.not_to change { TouristSpot.count }
    end

    it 'does not save without a xid' do
        tourist_spot = TouristSpot.new(name: "New York", 
        city: "New York",
        state: "New York",
        country: "USA",
        xid: nil,
        kinds: "restaurant, tourist spot, hotels, places",
        image: "",
        url: "",
        description: "New Yorkers relied on several varieties of transportation: ferries between Brooklyn and lower Manhattan.",
        coordenates: "lat: 40.730610, lon: -73.935242")
      expect { tourist_spot.save }.not_to change { TouristSpot.count }
    end

    it 'does not save without a description' do
        tourist_spot = TouristSpot.new(name: "New York", 
        city: "New York",
        state: "New York",
        country: "USA",
        xid: "xid_test",
        kinds: "restaurant, tourist spot, hotels, places",
        image: "",
        url: "",
        description: nil,
        coordenates: "lat: 40.730610, lon: -73.935242")
      expect { tourist_spot.save }.not_to change { TouristSpot.count }
    end

    it 'does not save without a coordenates' do
        tourist_spot = TouristSpot.new(name: "New York", 
        city: "New York",
        state: "New York",
        country: "USA",
        xid: "xid_test",
        kinds: "restaurant, tourist spot, hotels, places",
        image: "",
        url: "",
        description: "New Yorkers relied on several varieties of transportation: ferries between Brooklyn and lower Manhattan.",
        coordenates: nil)
      expect { tourist_spot.save }.not_to change { TouristSpot.count }
    end

  end
end