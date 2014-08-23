class Adventurer
  @@adventurers = []
  attr_reader :id, :password, :name, :adventures, :bio, :fave_book, :avatar

  def initialize attributes
  	@id = @@adventurers.length - 1
  	@password = attributes[:password]
  	@name = attributes[:name]
  	@adventures = []
  	@bio = attributes[:bio]
  	@fave_book = attributes[:fave_book]
  	@avatar = attributes[:avatar]
  end
	def self.all
    @@chapters
  end

  def self.clear
    @@chapters = []
  end

  def self.find_by_id id
    @@adventurers.at(id)
  end
end