require 'spec_helper'

describe DisciplinasController do
  let!(:disciplina) { FactoryGirl.create(:disciplina) }

  context "GET index" do
    it "assigns all disciplinas as @disciplinas" do
      get :index
      assigns(:disciplinas).should eq([disciplina])
    end

    it "renders the index view" do
      get :index
      response.should render_template :index
    end

  end

  context "GET show" do
    it "assigns the requested disciplina as @disciplina" do
      get :show, id: disciplina.to_param
      assigns(:disciplina).should eq(disciplina)
    end

    it "renders the show view" do
      get :show, id: disciplina.to_param
      response.should render_template :show
    end

  end

  context "GET new" do
    it "assigns a new disciplina as @disciplina" do
      get :new
      assigns(:disciplina).should be_a_new(Disciplina)
    end
  end

  context "GET edit" do
    it "assigns the requested disciplina as @disciplina" do
      get :edit, id: disciplina.to_param
      assigns(:disciplina).should eq(disciplina)
    end

    it "renders the edit view" do
      get :edit, id: disciplina.to_param
      response.should render_template :edit
    end

  end

  context "POST create" do
    context "with valid params" do
      it "creates a new disciplina" do
        expect {
          post :create, disciplina: FactoryGirl.attributes_for(:disciplina)
        }.to change(Disciplina, :count).by(1)
      end

      it "assigns a newly created disciplina as @disciplina" do
        post :create, disciplina: FactoryGirl.attributes_for(:disciplina)
        assigns(:disciplina).should be_a(Disciplina)
        assigns(:disciplina).should be_persisted
      end

      it "redirects to the created disciplina" do
        post :create, disciplina: FactoryGirl.attributes_for(:disciplina)
        response.code.should eq("302")
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved disciplina as @disciplina" do
        Disciplina.any_instance.stub(:save).and_return(false)
        post :create, disciplina: FactoryGirl.attributes_for(:invalid_disciplina)
        assigns(:disciplina).should be_a_new(Disciplina)
      end

      it "re-renders the 'new' template" do
        Disciplina.any_instance.stub(:save).and_return(false)
        post :create, disciplina: FactoryGirl.attributes_for(:invalid_disciplina)
        response.code.should eq("302")
      end
    end
  end

  context "PUT update" do
    context "with valid params" do
      it "updates the requested disciplina" do
        Disciplina.any_instance.should_receive(:update_attributes)
        put :update, {:id => disciplina.to_param, disciplina: FactoryGirl.attributes_for(:disciplina)}
      end

      it "assigns the requested disciplina as @disciplina" do
        put :update, {:id => disciplina.to_param, disciplina: FactoryGirl.attributes_for(:disciplina)}
        assigns(:disciplina).should eq(disciplina)
      end

      it "redirects to the disciplina" do
        put :update, {:id => disciplina.to_param, disciplina: FactoryGirl.attributes_for(:disciplina)}
        response.should redirect_to(disciplina)
      end
    end

    context "with invalid params" do
      it "assigns the disciplina as @disciplina" do
        Disciplina.any_instance.stub(:save).and_return(false)
        put :update, {:id => disciplina.to_param, disciplina: FactoryGirl.attributes_for(:invalid_disciplina)}
        assigns(:disciplina).should eq(disciplina)
      end

      it "re-renders the 'edit' template" do
        Disciplina.any_instance.stub(:save).and_return(false)
        put :update, {:id => disciplina.to_param, disciplina: FactoryGirl.attributes_for(:invalid_disciplina)}
        response.code.should eq("302")
      end
    end
  end

  context "DELETE destroy" do
    it "destroys the requested disciplina" do
      expect {
        delete :destroy, id: disciplina.to_param
      }.to change(Disciplina, :count).by(-1)
    end

    it "redirects to the disciplinas list" do
      delete :destroy, id: disciplina.to_param
      response.should redirect_to(disciplinas_url)
    end
  end

end
