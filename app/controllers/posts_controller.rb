class PostsController < ApplicationController
  def index
    @posts = Post.all
    @markers = @posts.map do |post|
      {
          post_id: post.id,
          lat: post.latitude,
          lng: post.longitude,
          photo_url: url_for(post.photo)
      }
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    Post.create!(post_params)

    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:latitude, :longitude, :image)
    end
end
