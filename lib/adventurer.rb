class Adventurer
  @@chapters = []
  attr_reader :name, :adventures, :bio, :fave_book, :avatar

  def initialize attributes
  	@name = attributes[:name]
  	@adventures = []
  	@bio = attributes[:bio]
  	@fave_book = attributes[:fave_book]
  	@avatar = attributes[:avatar]
  	adventure = Adventure.new(name: @name, id: Time.now.to_i)
  	@adventures << adventure.id
  end
	def self.all
    @@chapters
  end

  def self.clear
    @@chapters = []
  end
end