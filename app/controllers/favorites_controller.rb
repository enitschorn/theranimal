class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_article!

  private

  def find_animal!
    @animal = Animal.find_by_slug!(params[:animal_slug])
  end
end
