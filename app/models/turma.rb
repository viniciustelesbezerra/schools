class Turma
  include Mongoid::Document
  field :name, type: String
  embeds_many :alunos
  has_and_belongs_to_many :disciplinas
end
