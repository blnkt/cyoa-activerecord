class Adventurer
  @@adventurers = []
  attr_reader :id, :password, :name, :adventures, :bio, :fave_book, :avatar, :first_adventure

  def initialize attributes
  	@id = @@adventurers.length
  	@password = attributes[:password]
  	@name = attributes[:name]
  	@adventures = []
  	@bio = attributes[:bio]
  	@fave_book = attributes[:fave_book]
  	@avatar = attributes[:avatar]
  	@first_adventure = Adventure.new(name: @name)
  	@adventures << first_adventure
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

  def add_avatar name
  	case name
  	when 'human'
  		@avatar = "(]-_-[)"
  	when 'bear'
  		@avatar = "⊂(^( )^)⊃"
    when 'penguin'
    	@avatar = "ᶘᵒᴥᵒᶅ"
    when 'joker'
	    @avatar = "(♠_♦)"
    when 'kazoo'
	    @avatar = "( ͡°ʖ͡°)"
    else
    	@avatar = name
    end
  end

  def add_bio bio
  	@bio = bio
  end

  def self.name_checker username
  	@@adventurers.each do |adventurer|
  		if adventurer.name == username
  			return true
  		else
  			return false
  		end
  	end
  end

  def add_password password
  	@password = password
  end

  def self.find_by_user(name, password)
  	@bingo
  	@@adventurers.each do |adventurer|
  		if adventurer.name == name && adventurer.password == password
  			@bingo = adventurer
  			break
  		else
  			@bingo = nil
  		end
  	end
  	return @bingo if @bingo != nil
  end
end