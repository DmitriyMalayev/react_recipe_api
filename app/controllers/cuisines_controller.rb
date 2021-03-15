class CuisinesController < ApplicationController
  before_action :set_cuisine, only: [:show, :update, :destroy]

  # GET /cuisines
  def index
    @cuisines = Cuisine.all

    render json: @cuisines
  end

  # GET /cuisines/1
  def show
    render json: CuisineSerializer.new(@cuisine, include: [:recipes])
  end

  # POST /cuisines
  def create
    @cuisine = Cuisine.new(cuisine_params)

    if @cuisine.save
      render json: @cuisine, status: :created, location: @cuisine
    else
      render json: @cuisine.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuisine
      @cuisine = Cuisine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cuisine_params
      params.require(:cuisine).permit(:cuisine_name)
    end
end
