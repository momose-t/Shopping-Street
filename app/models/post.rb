class Post < ApplicationRecord
	 attachment :image
	 belongs_to :store
end
