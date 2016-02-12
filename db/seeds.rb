ingredients_seed_file = File.join(Rails.root, 'db', 'seeds/ingredients.yml')
ingredients_config = YAML::load_file(ingredients_seed_file)
Ingredient.create(ingredients_config)

cocktails_seed_file = File.join(Rails.root, 'db', 'seeds/cocktails.yml')
cocktails_config = YAML::load_file(cocktails_seed_file)
Cocktail.create(cocktails_config)

unless Rails.env.production?
  users_seed_file = File.join(Rails.root, 'db', 'seeds/users.yml')
  users_config = YAML::load_file(users_seed_file)
  User.create(users_config["users"])

  users_config["users_ingredients"].each do |u_i|
    user = User.find(u_i["user_id"].to_i)
    user.update_inventory(u_i["ingredient_id"].split(",").map(&:to_i))
  end

  users_config["follows"].each do |f|
    follower = User.find(f["follower_id"].to_i)
    followee = User.find(f["followee_id"].to_i)
    follower.follow followee
  end
end

