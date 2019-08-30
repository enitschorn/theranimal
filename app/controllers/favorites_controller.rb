class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_animal!

  def create
    current_user.favorite(@animal)
    render 'animals/show'
  end

  def destroy
    current_user.unfavorite(@animal)
    render 'animals/show'
  end

  private

  def find_animal!
    @animal = Animal.find_by_slug!(params[:animal_slug])
  end
end
