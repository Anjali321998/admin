class Like < ApplicationRecord
	#belongs_to :likeable,foreign_key: :likeable_id, polymorphic: true
	belongs_to :likeable, foreign_key: :likeable_id,polymorphic: true
	belongs_to :user,foreign_key: :user_id

end
