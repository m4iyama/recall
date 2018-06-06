usernames = (4..6).map {|n| "m#{n}iyama"}
centers = [{
               latitude: 35.6219,
               longitude: 139.6891,
           }, {
               latitude: 35.6896,
               longitude: 139.6921,
           }, {
               latitude: 35.6479,
               longitude: 139.7892,
           }]

usernames.each do |username|
  user = User.new(
      email: "#{username}@email.com",
      username: username,
      password: 'password',
      password_confirmation: 'password',
  )
  user.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_avatar.png')), filename: 'default_avatar.jpg', content_type: 'image/png')
  user.skip_confirmation!
  user.save!

  10.times do
    center = centers.sample
    post = user.posts.build(
        latitude: center[:latitude] + (Random.rand(0.01) - 0.005),
        longitude: center[:longitude] + (Random.rand(0.01) - 0.005),
    )
    filename = "test#{Random.rand(1..3)}.jpg"
    post.photo.attach(
        io: File.open(Rails.root.join('app', 'assets', 'images', filename)),
        filename: filename,
        content_type: 'image/jpeg'
    )
    post.save!
  end
end


