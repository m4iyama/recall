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

30.times do
  center = centers.sample
  photo = Photo.create(
      latitude: center[:latitude] + (Random.rand(0.01) - 0.005),
      longitude: center[:longitude] + (Random.rand(0.01) - 0.005),
  )
  filename = "test#{Random.rand(1..3)}.jpg"
  photo.image.attach(
      io: File.open(Rails.root.join('app', 'assets', 'images', filename)),
      filename: filename,
      content_type: 'image/jpeg'
  )
end