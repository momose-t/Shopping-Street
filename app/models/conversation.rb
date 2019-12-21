class Conversation < ApplicationRecord
	 belongs_to :owner
	 belongs_to :customer
	 has_many :messages
end
