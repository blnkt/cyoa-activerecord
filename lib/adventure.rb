class Adventure
  @@adventures = []
  attr_reader :progress, :name, :branches, :id

	def initialize attributes 
		@name = attributes[:name]
    @id = Time.new.strftime('%Y%m%d%H%M%S%L%24N').to_i
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
     return adventure if id == adventure.id
    end    
  end
end