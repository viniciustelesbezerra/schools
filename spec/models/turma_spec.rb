require 'spec_helper'

describe Turma do
  let!(:turma) { FactoryGirl.create(:turma) }	

  context "Instance Validations" do
		it { turma.should be_instance_of Turma }
		it { turma.should be_valid }
	end

	context "Realations" do
		it { should have_many(:disciplinas).through(:disciplina_turma) }
		it { should have_many(:alunos) }
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

    context "Function search" do
    	search = {}
    	it "with params" do
    		search[:professor] = "jenkins"
    		Turma.search(search).should eq([])
    	end

    	it "with no params" do
    		search[:id] = "all"
    		Turma.search(search).should include(turma)
    	end
    end

    context "Acceptance samples" do
    	it { turma.name.should eq("Turma Lux") }
    	it { turma.disciplinas.name.should eq("Disciplina") }
    end

end
