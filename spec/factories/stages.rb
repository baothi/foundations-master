# https://github.com/sevenwire/forgery#full-list-of-methods

FactoryGirl.define do
  factory :stage do
    name Forgery::Name.first_name
    order Forgery::Basic.number
  end
end
