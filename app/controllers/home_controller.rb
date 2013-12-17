class HomeController < ApplicationController
  before_action :set_post, only: [:show]
  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 5, order: 'created_at DESC')
  end
  
  def index_by_user
    @user = User.find(params[:id])
    @posts = Post.posts_by_user(@user).paginate(page: params[:page], per_page: 5, order: 'created_at DESC')
  end
  
  def index_by_tag
    @tag = Tag.find(params[:id])
    @posts = Post.posts_by_tag(@tag.id).paginate(page: params[:page], per_page: 5, order: 'created_at DESC')
  end
  
  def show    
    @comments = @post.comments
  end
  
  private

  def set_post
    @post = Post.find(params[:id])
  end
end
