class Chapter
  @@chapters = []
  attr_reader :episode, :choices, :name, :id, :parent_chapter,
:prompt

	def initialize attributes
		# @episode = attributes[:episode]
		# @id = attributes[:id]
		# @prompt = attributes[:prompt]
		# @parent_chapter = attributes[:parent_chapter]
		@choices = []
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

  def add_choice choice, author
    if @@chapters.length == 1
      @id = 0
      Chapter.new({:prompt => choice, :parent_chapter => @id, :id => (@id + 1), :name => author, :episode => "This choice needs your adventure!"})
      @id += 1
      @choices << @id
    else
      next_id = @@chapters.length
      Chapter.new({:prompt => choice, :parent_chapter => @id, :id => next_id, :name => author, :episode => "This choice needs your adventure!"})
      @choices << next_id
    end
  end

  def Chapter.by_id id
    @@chapters.at(id)   
  end
end