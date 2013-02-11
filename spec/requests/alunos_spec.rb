require 'spec_helper'

describe "Alunos" do
  
  	context "GET /alunos" do
  		let!(:turma) { FactoryGirl.create(:turma) }

  		it "New aluno" do
		    visit alunos_path
		    sleep(4)	    

		    click_link "New Aluno"
			
			fill_in "Name", with: "Aluno Novato"
			fill_in "Age", with: 20
			page.select "Turma Lux", from: "aluno[turma_id]"
			sleep(4)	    

			click_button "Create Aluno"
			page.should have_content("Turma Lux") 		
		end
	end

end
