# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
 
  factory :disciplina do
    name "NodeJS"

   	trait :invalid do
  	end

    factory :disciplina_with_turmas do
        ignore do
            disciplina_count 1
        end
        after(:create) do |disciplina, evaluator|
          FactoryGirl.create_list(:turma, evaluator.disciplina_count, disciplina: disciplina)
        end
    end

 	factory :invalid_disciplina, traits: [:invalid]
	association :professor, factory: :professor
  end

end
