module PostsHelper
  def to_marker(post)
    {
        post_id: post.id,
        lat: post.latitude,
        lng: post.longitude,
        photo_url: url_for(post.photo),
        post_url: user_post_path(user_username: post.user.username, id: post.id)
    }
  end
end
