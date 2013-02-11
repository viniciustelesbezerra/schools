class DisciplinaTurma < ActiveRecord::Base
  	belongs_to :disciplina
  	belongs_to :turma
  	validates :turma_id, :disciplina_id, presence: true 
end
