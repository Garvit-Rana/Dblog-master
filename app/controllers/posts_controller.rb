class PostsController < ApplicationController

before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_post, only: [:destroy]
  before_action :authorize_user, only: [:destroy]

  def home
  	@post = Post.new
  	@posts = Post.all
    @comment=Comment.new
  end

  def create

  	@post = Post.create(content: params[:post][:content], user_id: current_user.id)
    @comment =Comment.new

  end

  def destroy
        @post_id = @post.id

	@post.destroy

  	#redirect_to action: "home"
  end
def edit
    @postfind = Post.find(params[:id])
  end

  # receive data and update in database of a specific post
  def update
    @post = Post.find(params[:id])

    @post.update(content: params[:post][:content])
      redirect_to action: "home"

      end

  private

  def set_post
  	@post = Post.find(params[:id])
  end

  def authorize_user
  	if (@post.user_id != current_user.id)
  		redirect_to action: "home"
  	end

  end

end
