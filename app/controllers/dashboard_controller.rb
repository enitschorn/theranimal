class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user[:id])
    @therapies = @user.therapies
    @animals = @user.animals
  end
end
