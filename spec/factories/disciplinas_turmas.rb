# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  factory :disciplina_turma do
  	association :turma, factory: :turma
  	association :disciplina, factory: :disciplina
  end

end
