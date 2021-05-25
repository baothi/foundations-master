# https://github.com/sevenwire/forgery#full-list-of-methods

FactoryGirl.define do
  factory :community do
    name Forgery::Name.first_name
  end
end
