class Disciplina < ActiveRecord::Base
	belongs_to :professor
	has_many :disciplinas_turmas, dependent: :destroy
	has_many :turmas, through: :disciplinas_turmas
  	attr_accessible :name, :professor_id
end
