class Turma < ActiveRecord::Base
	has_many :alunos
	has_many :disciplina_turma, dependent: :destroy
	has_many :disciplinas, through: :disciplina_turma
  	attr_accessible :name
  	validates :name, presence: true 
  	default_scope includes([:disciplinas, :alunos])

  	def self.search(search)
	  if search && !search[:id].eql?('all')
	    includes(disciplinas: [:professor]).where(['turmas.name = ? or professors.name = ?', "#{search[:turma]}", "#{search[:professor]}"])
	  else
	    all
	  end
	end

end
