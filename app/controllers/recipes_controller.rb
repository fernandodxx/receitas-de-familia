class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.order(created_at: :desc).limit(12)
    @featured_recipe = Recipe.order('RANDOM()').first
  end

  def show
    @comment = Comment.new
    @comments = @recipe.comments.order(created_at: :desc)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice: 'Receita criada com sucesso!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Receita atualizada com sucesso!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path, notice: 'Receita excluída com sucesso!'
  end

  def search
    @query = params[:q]
    @recipes = Recipe.where('title LIKE ? OR description LIKE ?', "%#{@query}%", "%#{@query}%")
                     .order(created_at: :desc)
  end

  def by_region
    @region = params[:region]
    @recipes = Recipe.where(region: @region).order(created_at: :desc)
    @region_title = "Receitas da Região #{region_name(@region)}"
    render :index
  end

  def by_occasion
    @occasion = params[:occasion]
    @recipes = Recipe.where(occasion: @occasion).order(created_at: :desc)
    @occasion_title = "Receitas para #{occasion_name(@occasion)}"
    render :index
  end

  def by_category
    @category = params[:category]
    @recipes = Recipe.where(category: @category).order(created_at: :desc)
    @category_title = "Receitas de #{category_name(@category)}"
    render :index
  end

  private

  def set_recipe
    @recipe = Recipe.find_by!(slug: params[:slug])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :ingredients, :instructions,
                                   :category, :region, :occasion, :image_url, :prep_time, :servings)
  end

  def region_name(region)
    {
      'norte' => 'Norte',
      'nordeste' => 'Nordeste',
      'centro_oeste' => 'Centro-Oeste',
      'sudeste' => 'Sudeste',
      'sul' => 'Sul',
      'geral' => 'Geral'
    }[region] || region.to_s.humanize
  end

  def occasion_name(occasion)
    {
      'natal' => 'Natal',
      'pascoa' => 'Páscoa',
      'festa_junina' => 'Festa Junina',
      'dia_dos_pais' => 'Dia dos Pais',
      'dia_das_maes' => 'Dia das Mães',
      'aniversario' => 'Aniversário',
      'dia_a_dia' => 'Dia a Dia'
    }[occasion] || occasion.to_s.humanize
  end

  def category_name(category)
    {
      'entrada' => 'Entrada',
      'prato_principal' => 'Prato Principal',
      'sobremesa' => 'Sobremesa',
      'bebida' => 'Bebida',
      'acompanhamento' => 'Acompanhamento'
    }[category] || category.to_s.humanize
  end
end
