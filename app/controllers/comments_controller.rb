class CommentsController < ApplicationController
  before_action :set_recipe

  def create
    @comment = @recipe.comments.build(comment_params)

    if @comment.save
      redirect_to recipe_path(@recipe, anchor: 'comentarios'), notice: 'Comentário adicionado!'
    else
      redirect_to recipe_path(@recipe, anchor: 'comentarios'), alert: 'Erro ao adicionar comentário.'
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find_by!(slug: params[:recipe_slug])
  end

  def comment_params
    params.require(:comment).permit(:content, :author_name)
  end
end
