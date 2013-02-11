require 'spec_helper'

describe DisciplinaTurma do
  let!(:disciplina_turma) { FactoryGirl.create(:disciplina_turma) }	

  context "Instance Validations" do
		it { disciplina_turma.should be_instance_of DisciplinaTurma }
		it { disciplina_turma.should be_valid }
	end

	context "Realations" do
		it { should belong_to(:disciplina) }
		it { should belong_to(:turma) }
	end

	context "Attributes Validations" do
		[:disciplina_id, :turma_id].each do |attr| 
			it { should validate_presence_of(attr) }
	    end
	end

    context "Assigments" do
	    context "Not allowed" do
	      [:id, :_type, :disciplina_id, :turma_id].each do |attr| 
	        it { should_not allow_mass_assignment_of(attr) }
	      end
	    end

    end

    context "Acceptance samples" do
    	it { disciplina_turma.disciplina_id.should eq(1) }
    	it { disciplina_turma.turma_id.should eq(1) }
    end

end
