require 'spec_helper'

describe ProfessorsController do
  let!(:professor) { FactoryGirl.create(:professor) }

  context "GET index" do
    it "assigns all professors as @professors" do
      get :index
      assigns(:professors).should eq([professor])
    end

    it "renders the index view" do
      get :index
      response.should render_template :index
    end

  end

  context "GET show" do
    it "assigns the requested professor as @professor" do
      get :show, id: professor.to_param
      assigns(:professor).should eq(professor)
    end

    it "renders the show view" do
      get :show, id: professor.to_param
      response.should render_template :show
    end

  end

  context "GET new" do
    it "assigns a new professor as @professor" do
      get :new
      assigns(:professor).should be_a_new(Professor)
    end
  end

  context "GET edit" do
    it "assigns the requested professor as @professor" do
      get :edit, id: professor.to_param
      assigns(:professor).should eq(professor)
    end

    it "renders the edit view" do
      get :edit, id: professor.to_param
      response.should render_template :edit
    end

  end

  context "POST create" do
    context "with valid params" do
      it "creates a new professor" do
        expect {
          post :create, professor: FactoryGirl.attributes_for(:professor)
        }.to change(Professor, :count).by(1)
      end

      it "assigns a newly created professor as @professor" do
        post :create, professor: FactoryGirl.attributes_for(:professor)
        assigns(:professor).should be_a(Professor)
        assigns(:professor).should be_persisted
      end

      it "redirects to the created professor" do
        post :create, professor: FactoryGirl.attributes_for(:professor)
        response.code.should eq("302")
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved professor as @professor" do
        Professor.any_instance.stub(:save).and_return(false)
        post :create, professor: FactoryGirl.attributes_for(:invalid_professor)
        assigns(:professor).should be_a_new(Professor)
      end

      it "re-renders the 'new' template" do
        Professor.any_instance.stub(:save).and_return(false)
        post :create, professor: FactoryGirl.attributes_for(:invalid_professor)
        response.code.should eq("302")
      end
    end
  end

  context "PUT update" do
    context "with valid params" do
      it "updates the requested professor" do
        Professor.any_instance.should_receive(:update_attributes)
        put :update, {:id => professor.to_param, professor: FactoryGirl.attributes_for(:professor)}
      end

      it "assigns the requested professor as @professor" do
        put :update, {:id => professor.to_param, professor: FactoryGirl.attributes_for(:professor)}
        assigns(:professor).should eq(professor)
      end

      it "redirects to the professor" do
        put :update, {:id => professor.to_param, professor: FactoryGirl.attributes_for(:professor)}
        response.should redirect_to(professor)
      end
    end

    context "with invalid params" do
      it "assigns the professor as @professor" do
        Professor.any_instance.stub(:save).and_return(false)
        put :update, {:id => professor.to_param, professor: FactoryGirl.attributes_for(:invalid_professor)}
        assigns(:professor).should eq(professor)
      end

      it "re-renders the 'edit' template" do
        Professor.any_instance.stub(:save).and_return(false)
        put :update, {:id => professor.to_param, professor: FactoryGirl.attributes_for(:invalid_professor)}
        response.code.should eq("302")
      end
    end
  end

  context "DELETE destroy" do
    it "destroys the requested professor" do
      expect {
        delete :destroy, id: professor.to_param
      }.to change(Professor, :count).by(-1)
    end

    it "redirects to the professors list" do
      delete :destroy, id: professor.to_param
      response.should redirect_to(professors_url)
    end
  end

end
