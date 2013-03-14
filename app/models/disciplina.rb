class Disciplina < ActiveRecord::Base
	belongs_to :professor
	has_many :disciplina_turma, dependent: :destroy
	has_many :turmas, through: :disciplina_turma
  	attr_accessible :name, :professor_id
  	validates :name, presence: true 
  	default_scope includes(:professor)
end
