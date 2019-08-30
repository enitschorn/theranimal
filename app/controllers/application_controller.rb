class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:home, :index, :show, :kitchen_sink]

  # include Pundit

  # skip_before_action :authenticate_user!, only: [:home, :index, :show, :kitchen_sink]

  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def after_sign_in_path_for(resource)
    @user = current_user
    stored_location_for(resource) || dashboard_path(@user.id)
  end

  # private

  # def skip_pundit?
  #   devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  # end

  def current_user
    super || NullUser.new
  end

  def method_name

  end
end
