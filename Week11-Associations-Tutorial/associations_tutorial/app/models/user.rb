class User < ActiveRecord::Base
	# A user has many listings, the association is the inverse of the Listing.user association.
	# When we destroy our user, it should destroy the dependent objects (in this case the Listings)
	has_many :listings, inverse_of: :user, dependent: :destroy
end
