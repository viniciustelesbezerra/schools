# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :turma do
    name "Turma Lux"

   	trait :invalid do
  	end

  	factory :invalid_turma, traits: [:invalid]
  end

end
