class DisciplinaTurma < ActiveRecord::Base
  	belongs_to :disciplina
  	belongs_to :turma
end