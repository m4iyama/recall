class PostsController < ApplicationController
  include PostsHelper

  def index
    @posts = Post.includes(:user).with_attached_photo
    @markers = @posts.map {|post| to_marker(post)}
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path
    else
      puts "ERROR"
      puts @post.errors.full_messages
      render 'new'
    end
  end

  private

    def post_params
      params.require(:post).permit(:latitude, :longitude, :photo)
    end
end
