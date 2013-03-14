class Professor < ActiveRecord::Base
	has_many :disciplinas, dependent: :destroy
  	attr_accessible :name, :age 
  	validates :name, :age, presence: true 
end
