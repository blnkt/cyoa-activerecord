class Adventure
  @@adventures = []
  attr_reader :progress, :name, :branches

	def initialize attributes 
		@name = attributes[:name]
    @branches = []
    @progress = []
    @branches = []
    @@adventures << self
  end

  def Adventure.all
    @@adventures
  end

  def Adventure.clear
    @@adventures = []
  end

  def add_chapter chapter_id
    if @progress.include?(chapter_id)
      @branches << @progress unless @branches.include?(@progress)
    else
      @progress << chapter_id
    end
  end
end