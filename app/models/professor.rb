class Professor < ActiveRecord::Base
	has_many :disciplinas
  	attr_accessible :age, :name
end
