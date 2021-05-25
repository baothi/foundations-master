# https://github.com/sevenwire/forgery#full-list-of-methods

FactoryGirl.define do
  factory :model do
    name Forgery::Name.first_name
    description Forgery::LoremIpsum.paragraph
    square_footage 1200
  end
end
