class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:home, :index, :show, :kitchen_sink]

  def after_sign_in_path_for(resource)
    @user = current_user
    stored_location_for(resource) || dashboard_path(@user.id)
  end
end
