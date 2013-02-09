class Aluno < ActiveRecord::Base
	belongs_to :turma
  	attr_accessible :age, :name
end
