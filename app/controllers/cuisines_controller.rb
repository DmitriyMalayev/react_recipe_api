class CuisinesController < ApplicationController 
  before_action :set_cuisine, only: [:show, :update, :destroy]

  # GET /cuisines
  def index
    @cuisines = Cuisine.all

    render json: @cuisines
  end

  # GET /cuisines/1
  def show
   
    hash = CuisineSerializer.new(@cuisine, include: [:recipes]).serializable_hash
    render json: {
      cuisine: hash[:data][:attributes],
      recipes: hash[:included].map{|recipe| recipe[:attributes]}
    }
  end

  # POST /cuisines
  def create
    @cuisine = Cuisine.new(cuisine_params)

    if @cuisine.save
      render json: @cuisine, status: :created
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
      params.require(:cuisine).permit(:name)
    end
  end 