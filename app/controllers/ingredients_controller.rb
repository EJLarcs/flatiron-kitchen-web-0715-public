class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
  respond_to do |format|
    if @ingredient.save
      format.html { redirect_to @ingredient, notice: 'Ingredient was successfully stored.' }
      format.json { render action: 'show', status: :created, location: @ingredient }
    else
      format.html { render action: 'new' }
      format.json { render json: @ingredient.errors, status: :unprocessable_entity }
    end
  end
  end

  def update
    #in order to update/edit something you have to find it first!!
  @ingredient = Ingredient.find(params[:id])
  respond_to do |format|
    if @ingredient.update(ingredient_params)
      format.html { redirect_to @ingredient, notice: 'Ingredient was successfully updated.' }
      format.json { head :no_content }
    else
      format.html { render action: 'edit' }
      format.json { render json: @ingredient.errors, status: :unprocessable_entity }
    end
  end
end

def destroy
  @ingredient.destroy
  respond_to do |format|
    format.html { redirect_to ingredients_url }
    format.json { head :no_content }
  end
end

private
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
