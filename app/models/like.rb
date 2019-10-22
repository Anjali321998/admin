class Like < ApplicationRecord
	#belongs_to :likeable,foreign_key: :likeable_id, polymorphic: true
	belongs_to :likeable, foreign_key: :likeable_id,polymorphic: true
	enum like_status: [:liked,:unliked]

end
