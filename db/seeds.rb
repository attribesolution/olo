## Delete all roles ##
Role.delete_all
## Restart column id sequence to start with 1 ##
ActiveRecord::Base.connection.execute("ALTER SEQUENCE roles_id_seq RESTART WITH 1")

## Add default roles ##
Role.create(name: "admin")
Role.create(name: "restaurant_owner")
puts "Roles created: Admin and Restaurant Owner."

## Add an Admin User ##
user = User.create(email: "admin@dmenu.co", password: "321321321", name: "Admin", approved: true)
user.remove_role :restaurant_owner
user.add_role :admin
puts "Admin created."