class RelationshipsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    follower = User.find(params[:follower_id])
    followee = User.find(params[:followee_id])

    if relationship = follower.follow(followee)
      render json: { status: 'ok', relationship_id: relationship.id }
    else
      render json: { status: 'ng' }
    end
  end

  def destroy
    Relationship.find(params[:id]).destroy

    render json: { status: 'ok' }
  end
end
