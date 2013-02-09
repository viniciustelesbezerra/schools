# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :disciplinas_turma, :class => 'DisciplinasTurmas' do
    disciplina nil
    turma nil
  end
end
