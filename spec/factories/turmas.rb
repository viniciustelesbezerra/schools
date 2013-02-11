# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :turma do
    name "Turma Lux"

   	trait :invalid do
  	end

    factory :turma_with_disciplinas do
        ignore do
            disciplina_count 1
        end
        after(:create) do |turma, evaluator|
          FactoryGirl.create_list(:disciplina, evaluator.disciplina_count, turma: turma)
        end
    end

  	factory :invalid_turma, traits: [:invalid]
  end

end
