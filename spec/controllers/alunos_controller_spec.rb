require 'spec_helper'

describe AlunosController do
  let!(:aluno) { FactoryGirl.create(:aluno) }

  context "GET index" do
    it "assigns all alunos as @alunos" do
      get :index
      assigns(:alunos).should eq([aluno])
    end

    it "renders the index view" do
      get :index
      response.should render_template :index
    end

  end

  context "GET show" do
    it "assigns the requested aluno as @aluno" do
      get :show, id: aluno.to_param
      assigns(:aluno).should eq(aluno)
    end

    it "renders the show view" do
      get :show, id: aluno.to_param
      response.should render_template :show
    end

  end

  context "GET new" do
    it "assigns a new aluno as @aluno" do
      get :new
      assigns(:aluno).should be_a_new(Aluno)
    end
  end

  context "GET edit" do
    it "assigns the requested aluno as @aluno" do
      get :edit, id: aluno.to_param
      assigns(:aluno).should eq(aluno)
    end

    it "renders the edit view" do
      get :edit, id: aluno.to_param
      response.should render_template :edit
    end

  end

  context "POST create" do
    context "with valid params" do
      it "creates a new Aluno" do
        expect {
          post :create, aluno: FactoryGirl.attributes_for(:aluno)
        }.to change(Aluno, :count).by(1)
      end

      it "assigns a newly created aluno as @aluno" do
        post :create, aluno: FactoryGirl.attributes_for(:aluno)
        assigns(:aluno).should be_a(Aluno)
        assigns(:aluno).should be_persisted
      end

      it "redirects to the created aluno" do
        post :create, aluno: FactoryGirl.attributes_for(:aluno)
        response.code.should eq("302")
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved aluno as @aluno" do
        Aluno.any_instance.stub(:save).and_return(false)
        post :create, aluno: FactoryGirl.attributes_for(:invalid_aluno)
        assigns(:aluno).should be_a_new(Aluno)
      end

      it "re-renders the 'new' template" do
        Aluno.any_instance.stub(:save).and_return(false)
        post :create, aluno: FactoryGirl.attributes_for(:invalid_aluno)
        response.code.should eq("302")
      end
    end
  end

  context "PUT update" do
    context "with valid params" do
      it "updates the requested aluno" do
        Aluno.any_instance.should_receive(:update_attributes)
        put :update, {:id => aluno.to_param, aluno: FactoryGirl.attributes_for(:aluno)}
      end

      it "assigns the requested aluno as @aluno" do
        put :update, {:id => aluno.to_param, aluno: FactoryGirl.attributes_for(:aluno)}
        assigns(:aluno).should eq(aluno)
      end

      it "redirects to the aluno" do
        put :update, {:id => aluno.to_param, aluno: FactoryGirl.attributes_for(:aluno)}
        response.should redirect_to(aluno)
      end
    end

    context "with invalid params" do
      it "assigns the aluno as @aluno" do
        Aluno.any_instance.stub(:save).and_return(false)
        put :update, {:id => aluno.to_param, aluno: FactoryGirl.attributes_for(:invalid_aluno)}
        assigns(:aluno).should eq(aluno)
      end

      it "re-renders the 'edit' template" do
        Aluno.any_instance.stub(:save).and_return(false)
        put :update, {:id => aluno.to_param, aluno: FactoryGirl.attributes_for(:invalid_aluno)}
        response.code.should eq("302")
      end
    end
  end

  context "DELETE destroy" do
    it "destroys the requested aluno" do
      expect {
        delete :destroy, id: aluno.to_param
      }.to change(Aluno, :count).by(-1)
    end

    it "redirects to the alunos list" do
      delete :destroy, id: aluno.to_param
      response.should redirect_to(alunos_url)
    end
  end

end
