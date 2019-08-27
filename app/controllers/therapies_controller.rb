class TherapiesController < ApplicationController
  def index
    @therapies = Therapy.all
  end

  def show
    @therapy = Therapy.find(params[:id])
  end

  def new
    @therapy = Therapy.new
  end

end
