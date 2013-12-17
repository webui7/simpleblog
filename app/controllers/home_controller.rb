class HomeController < ApplicationController
  before_action :set_post, only: [:show]
  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 5, order: 'created_at DESC')
  end
  
  def show
    @posts = Post.all.paginate(page: params[:page], per_page: 5, order: 'created_at DESC')
  end
  
  private

  def set_post
    @post = Post.find(params[:id])
  end
end
