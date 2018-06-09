class PostsController < ApplicationController
  include PostsHelper

  def index
    redirect_to explore_url unless user_signed_in?

    @posts = Post.order('created_at desc').limit(5).where(user: [current_user, *current_user.followees]).includes(:user).with_attached_photo
    @markers = @posts.map {|post| to_marker(post)}
  end

  def explore
    @posts = Post.limit(5).includes(:user).with_attached_photo
    @markers = @posts.map {|post| to_marker(post)}

    render 'posts/index'
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
      render 'new'
    end
  end

  private

    def post_params
      params.require(:post).permit(:latitude, :longitude, :photo)
    end
end
