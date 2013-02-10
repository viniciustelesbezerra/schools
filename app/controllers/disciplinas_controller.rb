class DisciplinasController < ApplicationController
  def index
    @disciplinas = Disciplina.all
  end

  def show
    @disciplina = get_disciplina(params[:id])
  end

  def new
    @disciplina = Disciplina.new
  end

  def edit
    @disciplina = get_disciplina(params[:id])
  end

  def create
    @disciplina = Disciplina.new(params[:disciplina])
    flash[:notice] = 'Disciplina was successfully created.' if @disciplina.save
    respond_with(@disciplina)
  end

  def update
    @disciplina = get_disciplina(params[:id])
    flash[:notice] = 'Disciplina was successfully updated.' if @disciplina.update_attributes(params[:disciplina])
    respond_with(@disciplina)
  end

  def destroy
    @disciplina = get_disciplina(params[:id])
    flash[:notice] = 'Disciplina was successfully deleted.' if @disciplina.destroy
    respond_with(@disciplina)
  end

  private
  def get_disciplina(disciplina_id)
    Disciplina.find(disciplina_id)
  end

end