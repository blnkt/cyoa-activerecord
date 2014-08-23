class Chapter
  @@chapters = []
  attr_reader :episode, :choices, :name, :id, :parent_chapter, :prompt

	def initialize attributes
		@id = attributes[:id]
    @episode = attributes[:episode]
		@prompt = attributes[:prompt]
		@parent_chapter = attributes[:parent_chapter]
		@choices = []
		@@chapters << self
	end

	def self.all
    @@chapters
  end

  def self.clear
    @@chapters = []
  end

  def add_episode episode
    @episode = episode.to_s
  end

  def add_choice(choice, adventure_id)
    adventure = Adventure.find_by_id(adventure_id)
    if @@chapters.length == 1
      @id = 0
      Chapter.new({episode: "\nYour Princess is in another castle: \nEnter 'ae' to add an episode to this chapter\n", prompt: choice, parent_chapter: @id, id: (@id + 1), adventure_id: adventure_id})
      @choices << @id + 1
    else
      next_id = @@chapters.length
      Chapter.new({episode: "\nYour Princess is in another castle: \nEnter 'ae' to add an episode to this chapter\n", prompt: choice, parent_chapter: @id, id: next_id, adventure_id: adventure_id})
      @choices << next_id
    end
  end

  def self.find_by_id id
    @@chapters.at(id.to_i)
  end
end