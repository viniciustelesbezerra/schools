require 'spec_helper'

describe Professor do
  let!(:professor) { FactoryGirl.create(:professor_with_disciplinas) }	

  context "Instance Validations" do
		it { professor.should be_instance_of Professor }
		it { professor.should be_valid }
	end

	context "Realations" do
		it { should have_many(:disciplinas) }
	end

	context "Attributes Validations" do
		[:name, :age].each do |attr| 
			it { should validate_presence_of(attr) }
	    end
	end

    context "Assigments" do
	    context "Allowed" do
	      [:name, :age].each do |attr| 
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
    	it { professor.name.should eq("Professor Jenkins") }
    	it { professor.age.should eq(45) }
    	#it { professor.disciplinas.professor_id.should eq(1) }
    	it { professor.disciplinas.name.should eq("Disciplina") }
    end


end
