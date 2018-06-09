class UsersController < ApplicationController
  include PostsHelper

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(username: params[:username])
    @posts = @user.posts
    @markers = @posts.map {|post| to_marker(post)}
    @relationship_id = user_signed_in? && Relationship.where(follower_id: current_user.id).where(followee_id: @user.id).first&.id

    puts @relationship_id
  end

  def edit
    @user = User.find_by(username: params[:username])
  end
end
