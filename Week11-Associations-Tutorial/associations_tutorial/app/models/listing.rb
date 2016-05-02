class Listing < ActiveRecord::Base
	# An individual listing belongs to a single user object. 
	# This is the inverse of the User.listings association
	belongs_to :user, inverse_of: :listings
end
