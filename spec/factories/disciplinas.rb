# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  #Factory.define :listing_with_features, :parent => :listing do |listing|
  #listing.after_create { |l| Factory(:feature, :listing => l)  }
  #end

  factory :disciplina do
    name "NodeJS"

   	trait :invalid do
  	end

  	FactoryGirl.define :disciplina_with_turmas, parent: :disciplina do |disciplina|
  		disciplina.after_create { |d| Factory(:turma, disciplina: d) }
  	end

  	factory :invalid_disciplina, traits: [:invalid]
	association :professor, factory: :professor
  end

end
