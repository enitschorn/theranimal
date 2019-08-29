class AnimalsController < ApplicationController
  def index
    if params[:query]
      @animals = Animal.where("species ILIKE ?", "%#{params[:query]}%")
    else
      @animals = Animal.all
    end
    flash[:alert] = "Sorry, #{params[:query].capitalize} is not available, please try another one" if @animals.empty?
    redirect_to animals_path
  end

  def show
    @animal = Animal.find(params[:id])
    @therapy = Therapy.new
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    if @animal.save
      flash[:alert] = 'You have successfully created an animal.'
    else
      flash[:alert] = 'You cannot create this animal.'
    end
    redirect_to dashboard_path(@animal.user)
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    @animal.update(animal_params)
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to animals_path
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :species, :price, :description, :photo)
  end
end
