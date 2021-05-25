# https://github.com/sevenwire/forgery#full-list-of-methods

FactoryGirl.define do
  factory :client do
    first_name Forgery::Name.first_name
    last_name Forgery::Name.last_name
    email Forgery::Internet.email_address
    password Forgery::Basic.password
    association :model, factory: :model
    association :community, factory: :community
  end
end
