FactoryBot.define do
  factory :profile do
    user
    instrument { "Guitar" }
    favorite_music { "Rock" }
    favorite_artist { "The Beatles" }
    introduction { "I love playing guitar!" }
  end
end