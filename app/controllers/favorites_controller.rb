class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_animal!
  skip_before_action :verify_authenticity_token

  def create
    Favorite.create!(animal_id: params[:animal_id], user_id: current_user.id)
  end

  def destroy
    Favorite.find_by(animal_id: params[:animal_id], user_id: current_user.id).delete
  end

  private

  def find_animal!
    @animal = Animal.find(1)
  end
end
