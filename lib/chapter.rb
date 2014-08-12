class Chapter
  
  attr_reader :episode

	def initialize attributes
		@episode = attributes[:episode]
	end
end