class Turma < ActiveRecord::Base
	has_many :disciplina_turma, dependent: :destroy
	has_many :disciplinas, through: :disciplina_turma
  	accepts_nested_attributes_for :disciplinas  	
  	attr_accessible :name, :disciplinas_attributes

  	def self.search(search)
	  puts search.pretty_inspect
	  if search
	    find(:all, conditions: ['name = ? or professor.name = ?', "#{search[:turma]}", "#{search[:professor]}" ])
	  else
	    find(:all)
	  end
	end

end

