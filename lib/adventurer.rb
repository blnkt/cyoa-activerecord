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

  def add_avatar name
  	case name
  	when 'ambivalent'
  		@avatar = "(]-_-[)"
  	when 'bear'
  		@avatar = "⊂(^( )^)⊃"
    when 'koala'
    	@avatar = "ᶘᵒᴥᵒᶅ"
    when 'confused'
	    @avatar = "(♠_♦)"
    when 'shifty'
	    @avatar = "( ͡°ʖ͡°)"
    else
    	@avatar = name
    end
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