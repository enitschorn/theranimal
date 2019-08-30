class AnimalsController < ApplicationController
  def index
    if params[:query]
      @animals = Animal.where("species ILIKE ? OR name ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
      if @animals.empty?
        flash[:alert] = "Sorry, #{params[:query].capitalize} is not available, please try another one"
        redirect_to animals_path
      end
    else
      @animals = Animal.all

      @markers = @animals.map do |animal|
        {
          lat: animal.latitude,
          lng: animal.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { animal: animal }),
          image_url: helpers.asset_url('theranimal_logo.png')
        }
      end
    end
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
    redirect_to dashboard_path(@user.id)
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

  def rating

  end

  private

  def animal_params
    params.require(:animal).permit(:name, :species, :price, :description, :photo)
  end
end
