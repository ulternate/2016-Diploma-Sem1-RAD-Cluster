class CreateUsersAndListings < ActiveRecord::Migration
	# Create two simple tables for our user and listing models
	def change
		# User table, only having a name column for the example
		create_table :users do |t|
			t.string :name
			t.timestamps null: false
		end
 		
 		# Listing table.
 		# This table stores the id of the user that this belongs_to
 		# so we need a column to store that information.
 		# Thankfully, when doing it as part of a migration, Rails
 		# does this for you.
		create_table :listings do |t|
			# Set the belongs_to association in the database as a column that is indexed
			t.belongs_to :user, index: true
			t.string :name
			t.datetime :listing_date
			t.timestamps null: false
		end
	end
end
