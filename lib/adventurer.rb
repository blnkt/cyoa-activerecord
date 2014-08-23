class Adventurer
  @@adventurers = []
  attr_reader :password, :name, :adventures, :bio, :fave_book, :avatar

  def initialize attributes
  	@password = attributes[:password]
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

  def self.find_by_id id
    @@adventurers.each do |adventurer|
      if id == adventure.id
        return adventure
      end
    end    
  end
end