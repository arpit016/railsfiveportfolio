# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

9.times do |portfolio_item|
   Portfolio.create!(
       title: "Project #{portfolio_item}",
       subtitle: "Web app Service",
       body: "Donec facilisis blandit congue. Nullam consequat eget ex eu egestas. Curabitur porttitor aliquet efficitur. Quisque vel dictum dui. Aliquam dui nisl, facilisis vel convallis at, cursus nec diam. Aenean dapibus, nunc non lobortis mattis, ante libero hendrerit dui, a tincidunt velit diam sed ante. Sed ultricies mollis urna volutpat tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed egestas, tellus id mollis vehicula, mi turpis elementum libero, sed pellentesque odio nulla non ligula.",
       main_image: "http://via.placeholder.com/600x400",
       thumb_image: "http://via.placeholder.com/350x200"
       ) 
end
