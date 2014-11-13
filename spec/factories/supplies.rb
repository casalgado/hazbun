# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :supply do
    supply_type "MyString"
    quantity 1
  end
end
