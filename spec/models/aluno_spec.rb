require 'spec_helper'

describe Aluno do
	let!(:aluno) { FactoryGirl.create(:aluno) }

	context "Instance Validations" do
		it { aluno.should be_instance_of Aluno }
		it { aluno.should be_valid }
	end

	context "Realations" do
		it { should belong_to(:turma) }
	end

	context "Attributes Validations" do
		[:name, :age].each do |attr| 
			it { should validate_presence_of(attr) }
	    end
	end

    context "Assigments" do
	    context "Allowed" do
	      [:name, :age, :turma_id].each do |attr| 
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
    	it { aluno.name.should eq("Aluno Um") }
    	it { aluno.age.should eq(11) }
    	it { aluno.turma_id.should eq(1) }
    	it { aluno.turma.name.should eq("Turma Lux") }
    end

end
	