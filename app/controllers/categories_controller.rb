class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @category_posts = []
    posts = Post.all
    posts.each do |post|
      @category_posts << post if post.category_id == @category.id
    end
    
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.create(params[:category])
    redirect_to category_path(category)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update(params.require(:category))
    redirect_to category_path(category)
  end
end
