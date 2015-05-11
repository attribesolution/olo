## Delete all roles ##
Role.destroy_all
## Restart column id sequence to start with 1 ##
ActiveRecord::Base.connection.execute("ALTER SEQUENCE roles_id_seq RESTART WITH 1")

## Add default roles ##
Role.create(
	name: "admin"
	)
Role.create(
	name: "restaurant_owner"
	)