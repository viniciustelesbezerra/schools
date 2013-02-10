class ProfessorsController < ApplicationController
  def index
    @professors = Professor.all
  end

  def show
    @professor = get_professor(params[:id])
  end

  def new
    @professor = Professor.new
  end

  def edit
    @professor = get_professor(params[:id])
  end

  def create
    @professor = Professor.new(params[:professor])
    flash[:notice] = 'Professor was successfully created.' if @professor.save
    respond_with(@professor)
  end

  def update
    @professor = get_professor(params[:id])
    flash[:notice] = 'Professor was successfully updated.' if @professor.update_attributes(params[:professor])
    respond_with(@professor)
  end

  def destroy
    @professor = get_professor(params[:id])
    flash[:notice] = 'Professor was successfully deleted.' if @professor.destroy
    respond_with(@professor)
  end
  
  private
  def get_professor(professor_id)
    Professor.find(professor_id)
  end
  
end
