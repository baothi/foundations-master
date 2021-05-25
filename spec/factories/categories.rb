# https://github.com/sevenwire/forgery#full-list-of-methods

FactoryGirl.define do
  factory :category do
    name Forgery::Name.full_name
    description Forgery::LoremIpsum.paragraph
  end
end
