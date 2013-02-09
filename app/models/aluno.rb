class Aluno
  include Mongoid::Document
  field :name, type: String
  field :age, type: Integer
  embedded_in :turma
end
