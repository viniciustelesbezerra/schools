require 'spec_helper'

describe Disciplina do
  let!(:disciplina) { FactoryGirl.create(:disciplina) }	

  context "Instance Validations" do
		it { disciplina.should be_instance_of Disciplina }
		it { disciplina.should be_valid }
	end

	context "Realations" do
		it { should have_many(:turmas).through(:disciplina_turma) }
		it { should belong_to(:professor) }
		it { should have_many(:disciplina_turma) }
	end

	context "Attributes Validations" do
		[:name].each do |attr| 
			it { should validate_presence_of(attr) }
	    end
	end

    context "Assigments" do
	    context "Allowed" do
	      [:name].each do |attr| 
	        it { should allow_mass_assignment_of(attr) }
	      end
	    end

	    context "Not allowed" do
	      [:id, :_type].each do |attr| 
	        it { should_not allow_mass_assignment_of(attr) }
	      end
	    end

    end

    context "Acceptance samples" do
    	it { disciplina.name.should eq("NodeJS") }
    	it { disciplina.turmas.name.should eq("Turma") }
    end


end
