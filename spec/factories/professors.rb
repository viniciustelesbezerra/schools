# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  factory :professor do
    name "Professor Jenkins"
    age 45

   	trait :invalid do
  	end

	
  	factory :professor_with_disciplinas do
        ignore do
            professor_count 1
        end
        after(:create) do |professor, evaluator|
            FactoryGirl.create_list(:disciplina, evaluator.professor_count, professor: professor)
        end
    end
       
    factory :invalid_professor, traits: [:invalid]
  end

end
