class Turma < ActiveRecord::Base
	has_many :disciplinas_turmas, dependent: :destroy
	has_many :disciplinas, through: :disciplinas_turmas
  	attr_accessible :name
end
