module ForumsHelper
	def rated_or_not(forum_id)
		items=Rate.where(:rateable_id=>forum_id).first
		if not items.nil? and items.stars
				return items.stars.to_s
			else
				return "not rated"
			end
	

	end
end
