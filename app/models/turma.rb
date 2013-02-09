class Turma < ActiveRecord::Base
	has_many :disciplinas_turmas, dependent: :destroy
	has_many :disciplinas, through: :disciplinas_turmas
  	accepts_nested_attributes_for :disciplinas
  	attr_accessible :name
end
