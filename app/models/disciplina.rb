class Disciplina
  include Mongoid::Document
  field :name, type: String
  embedded_in :professor
  has_and_belongs_to_many :turmas
end
