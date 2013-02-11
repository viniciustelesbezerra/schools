require 'spec_helper'

describe TurmasController do
  let!(:turma) { FactoryGirl.create(:turma) }

  context "GET index" do
    it "assigns all turmas as @turmas" do
      get :index
      assigns(:turmas).should eq([turma])
    end

    it "renders the index view" do
      get :index
      response.should render_template :index
    end

  end

  context "GET show" do
    it "assigns the requested turma as @turma" do
      get :show, id: turma.to_param
      assigns(:turma).should eq(turma)
    end

    it "renders the show view" do
      get :show, id: turma.to_param
      response.should render_template :show
    end

  end

  context "GET new" do
    it "assigns a new turma as @turma" do
      get :new
      assigns(:turma).should be_a_new(Turma)
    end
  end

  context "GET edit" do
    it "assigns the requested turma as @turma" do
      get :edit, id: turma.to_param
      assigns(:turma).should eq(turma)
    end

    it "renders the edit view" do
      get :edit, id: turma.to_param
      response.should render_template :edit
    end

  end

  context "POST create" do
    context "with valid params" do
      it "creates a new turma" do
        expect {
          post :create, turma: FactoryGirl.attributes_for(:turma)
        }.to change(Turma, :count).by(1)
      end

      it "assigns a newly created turma as @turma" do
        post :create, turma: FactoryGirl.attributes_for(:turma)
        assigns(:turma).should be_a(Turma)
        assigns(:turma).should be_persisted
      end

      it "redirects to the created turma" do
        post :create, turma: FactoryGirl.attributes_for(:turma)
        response.code.should eq("302")
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved turma as @turma" do
        Turma.any_instance.stub(:save).and_return(false)
        post :create, turma: FactoryGirl.attributes_for(:invalid_turma)
        assigns(:turma).should be_a_new(Turma)
      end

      it "re-renders the 'new' template" do
        Turma.any_instance.stub(:save).and_return(false)
        post :create, turma: FactoryGirl.attributes_for(:invalid_turma)
        response.code.should eq("302")
      end
    end
  end

  context "PUT update" do
    context "with valid params" do
      it "updates the requested turma" do
        Turma.any_instance.should_receive(:update_attributes)
        put :update, {:id => turma.to_param, turma: FactoryGirl.attributes_for(:turma)}
      end

      it "assigns the requested turma as @turma" do
        put :update, {:id => turma.to_param, turma: FactoryGirl.attributes_for(:turma)}
        assigns(:turma).should eq(turma)
      end

      it "redirects to the turma" do
        put :update, {:id => turma.to_param, turma: FactoryGirl.attributes_for(:turma)}
        response.should redirect_to(turma)
      end
    end

    context "with invalid params" do
      it "assigns the turma as @turma" do
        Turma.any_instance.stub(:save).and_return(false)
        put :update, {:id => turma.to_param, turma: FactoryGirl.attributes_for(:invalid_turma)}
        assigns(:turma).should eq(turma)
      end

      it "re-renders the 'edit' template" do
        Turma.any_instance.stub(:save).and_return(false)
        put :update, {:id => turma.to_param, turma: FactoryGirl.attributes_for(:invalid_turma)}
        response.code.should eq("302")
      end
    end
  end

  context "DELETE destroy" do
    it "destroys the requested turma" do
      expect {
        delete :destroy, id: turma.to_param
      }.to change(Turma, :count).by(-1)
    end

    it "redirects to the turmas list" do
      delete :destroy, id: turma.to_param
      response.should redirect_to(turmas_url)
    end
  end

end
