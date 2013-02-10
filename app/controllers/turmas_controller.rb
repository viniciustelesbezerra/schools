class TurmasController < ApplicationController
  def report
    @turmas = Turma.search(params)
  end

  def index
    @turmas = Turma.all
  end

  def show
    @turma = get_turma(params[:id])
  end

  def new
    @turma = Turma.new
  end

  def edit
    @turma = get_turma(params[:id])
  end

  def create
    @turma = Turma.new(params[:turma])
    if @turma.save
      params[:disciplinas][:id].each{ |id_disciplna| @turma.disciplinas.push(Disciplina.find(id_disciplna)) }
      flash[:notice] = 'Turma was successfully created.'
    end    
    respond_with(@turma)
  end

  def update
    @turma = get_turma(params[:id])
    flash[:notice] = 'Turma was successfully updated.' if @turma.update_attributes(params[:turma])
    respond_with(@turma)
  end

  def destroy
    @turma = get_turma(params[:id])
    flash[:notice] = 'Turma was successfully deleted.' if @turma.destroy
    respond_with(@turma)
  end
  
  private
  def get_turma(turma_id)
    Turma.find(turma_id)
  end
  
end
