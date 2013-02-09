class Professor
  include Mongoid::Document
  field :name, type: String
  field :age, type: Integer
  embeds_many :disciplinas
end
