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
end