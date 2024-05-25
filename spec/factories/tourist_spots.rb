# spec/factories/tourist_spots.rb
FactoryBot.define do
    factory :tourist_spot do
      name { Faker::TouristSpot.name }
      city { Faker::TouristSpot.city }
      state { Faker::TouristSpot.state }
      country { Faker::TouristSpot.country }
      xid { Faker::TouristSpot.xid }
      kinds { Faker::TouristSpot.kinds }
      image { Faker::TouristSpot.image }
      url { Faker::TouristSpot.url }
      description { Faker::TouristSpot.description }
      coordenates { Faker::TouristSpot.coordenates }
    end
  end
  