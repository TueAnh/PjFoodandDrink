# User.create!(name: "BuBu", email: "bubu@gmail.com",
#   password: "bubu123", password_confirmation: "bubu123", role: 1)
# Category.create!(name: "Foods")
# Category.create!(name: "Drinks")
# Product.create!(name: "banh ngot", description: "banh nay ngon", quantity: 100, price: 12000, 
#   image: "no_image.jpg", category_id: 1)

# 5.times do
#   name = Faker::Name.name
#   description = "Coca cola la orion"
#   quantity = 100
#   price = 10000
#   image = "no_image.jpg"
#   category_id = 2
#   Product.create!(name: name, description: description, quantity: quantity, price: price, 
#     image: image, category_id: category_id)
# end

# Order.create!(user_id: 1)
# OrderItem.create!(order_id: 1, product_id: 1, quantity: 3)
User.create!(name: "BuBu", email: "bubu1@gmail.com",
  password: "bubu123", password_confirmation: "bubu123", role: 1)