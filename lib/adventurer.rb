class Adventurer
  @@adventurers = []
  attr_reader :id, :password, :name, :adventures, :bio, :fave_book, :avatar

  def initialize attributes
  	@id = @@adventurers.length
  	@password = attributes[:password]
  	@name = attributes[:name]
  	@adventures = []
  	@bio = attributes[:bio]
  	@fave_book = attributes[:fave_book]
  	@avatar = attributes[:avatar]
  	@@adventurers << self
  end
	def self.all
    @@adventurers
  end

  def self.clear
    @@adventurers = []
  end

  def self.find_by_id id
  	return nil if id > @@adventurers.length
    @@adventurers.at(id)
  end
end