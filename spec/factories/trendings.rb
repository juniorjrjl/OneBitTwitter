FactoryBot.define do
    factory :trending do
        hashtags { { 
            "#{FFaker::Lorem.word}" => rand(1..999),
            "#{FFaker::Lorem.word}" => rand(1..999),
            "#{FFaker::Lorem.word}" => rand(1..999),
            "#{FFaker::Lorem.word}" => rand(1..999),
            "#{FFaker::Lorem.word}" => rand(1..999)
            } }
    end
end