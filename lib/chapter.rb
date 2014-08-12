class Chapter
  @@chapters = []
  attr_reader :episode

	def initialize attributes
		@episode = attributes[:episode]
		@@chapters << self
	end

	def Chapter.all
    @@chapters
  end

  def Chapter.clear
    @@chapters = []
  end
end