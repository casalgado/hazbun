# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    association :order
    item_type_id 1
    materiales_por_prenda_id 1
  end
end
