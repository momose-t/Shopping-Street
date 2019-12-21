class Store < ApplicationRecord
	 attachment :image
	 belongs_to :owner
	 has_many :posts
end
