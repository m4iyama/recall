class UsersController < ApplicationController
  include PostsHelper

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(username: params[:username])
    @posts = @user.posts
    @markers = @posts.map {|post| to_marker(post)}
  end
end
