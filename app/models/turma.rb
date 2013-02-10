class Turma < ActiveRecord::Base
	has_many :disciplina_turma, dependent: :destroy
	has_many :disciplinas, through: :disciplina_turma
  	accepts_nested_attributes_for :disciplinas  	
  	attr_accessible :name, :disciplinas_attributes

  	def self.search(search)
	  if search && !search[:id].eql?('all')
	    includes(:disciplinas => [:professor]).where(['turmas.name = ? or professors.name = ?', "#{search[:turma]}", "#{search[:professor]}"])
	  else
	    all
	  end
	end

end
