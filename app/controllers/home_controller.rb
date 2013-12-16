class HomeController < ApplicationController
  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 5, order: 'created_at DESC')
  end
end
