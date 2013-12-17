class CommentsController < ApplicationController
  before_action :set_post, only: [:index, :create]

  # GET /posts
  # GET /posts.json
  def index
    @comments = @post.comments.(order: 'created_at DESC')
  end


  def create
    post= @post.comments.build(comment_params)

    respond_to do |format|
      if post.save
        format.html { redirect_to controller: "home", action: 'show', id: @post.id, notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      #params[:post]
      params.require(:comment).permit(:title, :body, :post_id, :user_id)
    end
end
