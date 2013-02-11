# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  factory :aluno do
    name "Aluno Um"
    age 11
  
   	trait :invalid do
  	end

  	factory :invalid_aluno, traits: [:invalid]
    association :turma, factory: :turma
  end

end
