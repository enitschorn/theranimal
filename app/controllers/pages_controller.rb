class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show, :kitchen_sink]

  def home
  end
end
