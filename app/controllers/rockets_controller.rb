class RocketsController < ApplicationController
  before_action :set_rocket, only: %i[ show edit update destroy ]

  def index
    @rockets = Rocket.all
  end

  def show
  end

  def new
    @rocket = Rocket.new
  end

  def create
    @rocket = Rocket.new(params_rocket)
    @rocket.user = current_user
    if @rocket.save
      redirect_to rocket_path(@rocket)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
  end

  def update
  end

  def destroy
  end

  private

  def params_rocket
    params.require(:rocket).permit(:name, :content, :price_per_day, :number_passengers, :img_url)
  end

  def set_rocket
    @rocket = Rocket.find(params[:id])
  end
end