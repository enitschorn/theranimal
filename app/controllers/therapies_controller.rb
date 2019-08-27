class TherapiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @therapies = Therapy.all
  end

  def show
    @therapy = Therapy.find(params[:id])
  end

  def new
    @animal = Animal.find(params[:animal_id])
    @therapy = Therapy.new
  end

  def create
    @therapy = Therapy.new(therapy_params)
    @animal = Animal.find(params[:animal_id])
    @therapy.animal = @animal
    @therapy.price = @animal.price
    @therapy.user = current_user
    @therapy.save
    redirect_to animal_path(@animal)
  end

  private

  def therapy_params
    params.require(:therapy).permit(:start_on, :end_on)
  end

end
