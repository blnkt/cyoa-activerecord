class Chapter
  @@chapters = []
  attr_reader :episode, :name

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

  def add_episode episode
    @episode = episode.to_s
  end

end