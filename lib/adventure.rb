class Adventure
  @@adventures = []
  attr_reader :progress, :name, :branches, :id

	def initialize attributes 
    @id = Time.now.to_i
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

  def self.find_by_id id
    @@adventures.each do |adventure|
      if id == adventure.id
        return adventure
      end
    end    
  end
end