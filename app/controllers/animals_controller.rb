class AnimalsController < ApplicationController
  def index
    if params[:query]
      @animals = Animal.where("species ILIKE ? OR name ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
      if @animals.empty?
        flash[:alert] = "Sorry, #{params[:query].capitalize} is not available, please try another one"
        redirect_to animals_path
      end
    else
      @animals = Animal.geocoded
    end

    @markers = animal_markers
    @animals = @animals.favorited_by(params[:favorited]) if params[:favorited].present?
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
      flash[:alert] = 'You have successfully added your animal.'
    else
      flash[:alert] = 'You cannot add this animal.'
    end
    redirect_to @animal
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    @animal.update(animal_params)
    redirect_to dashboard_path
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to dashboard_path
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :species, :price, :description, :photo)
  end

  def animal_markers
    @animals.map do |animal|
      {
        lat: animal.latitude,
        lng: animal.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { animal: animal }),
        image_url: helpers.asset_url('theranimal_logo.png')
      }
    end
  end
end
