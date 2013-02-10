class Disciplina < ActiveRecord::Base
	belongs_to :professor
	has_many :disciplina_turma, dependent: :destroy
	has_many :turmas, through: :disciplina_turma
  	attr_accessible :id, :name, :professor_id
end
