class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  # GET /recipes
  def index
    @recipes = Recipe.all 
    @data = RecipeSerializer.new(@recipes).serializable_hash[:data].map{|hash| hash[:attributes]}
    render json: @data
  end

  # GET /recipes/1
  def show
    hash = RecipeSerializer.new(@recipe, include: [:recipes]).serializable_hash 
    render json: {
      cuisine: hash[:data][:attributes],
      recipes: hash[:included].map{|recipe| recipe[:attributes]}
    }
  end

  # Because a user has_many :recipes, we can do current_user.recipes.build in our controller to have the foreign key, :user_id, assigned automatically. 
  # POST /recipes
  def create
    @recipe = current_user.recipes.build(recipe_params) 
    if @recipe.save
      render json: @recipe, status: :created
    else
      render json: @recipe.errors, status: :unprocessable_entity 
    end 
  end


  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      render json: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:name, :description, :recipe_image, :cuisine_id)
    end
end
