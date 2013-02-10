class AlunosController < ApplicationController
  def index
    @alunos = Aluno.all
  end

  def show
    @aluno = get_aluno(params[:id])
  end

  def new
    @aluno = Aluno.new
  end

  def edit
    @aluno = get_aluno(params[:id])
  end

  def create
    @aluno = Aluno.new(params[:aluno])
    flash[:notice] = 'Aluno was successfully created.' if @aluno.save
    respond_with(@aluno)
  end

  def update
    @aluno = get_aluno(params[:id])
    flash[:notice] = 'Aluno was successfully updated.' if @aluno.update_attributes(params[:aluno])
    respond_with(@aluno)
  end

  def destroy
    @aluno = get_aluno(params[:id])
    flash[:notice] = 'Aluno was successfully deleted.' if @aluno.destroy
    respond_with(@aluno)
  end

  private
  def get_aluno(aluno_id)
    Aluno.find(aluno_id)
  end

end
