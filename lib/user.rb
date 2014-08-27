class User < ActiveRecord::Base
	attr_accessor :new_password, :new_password_confirmation
	has_one :avatar
	has_many :adventures

	validates_confirmation_of :new_password, :if=>:password_changed?
  before_save :hash_new_password, :if=>:password_changed?

  @@adventurers = []
  attr_reader :id, :name, :bio, :fave, :first_adventure

  def initialize attributes
  	@id = @@adventurers.length
  	@password = attributes[:password]
  	@name = attributes[:name]
  	@adventures = []
  	@bio = attributes[:bio]
  	@fave = attributes[:fave]
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

  def self.authenticate(email, password)
    if user = find_by_email(email)
      # Then compare the provided password against the hashed one in the db.
      if BCrypt::Password.new(user.hashed_password).is_password? password
        # If they match we return the user 
        return user
      end
    end
    # If we get here it means either there's no user with that email, or the wrong
    # password was provided.  But we don't want to let an attacker know which. 
    return nil
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

  def add_fave fave
  	@fave = fave
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
  en
d
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

  def password_changed?
    !@new_password.blank?
  end

  private
  def hash_new_password
      self.hashed_password = BCrypt::Password.create(@new_password)
    end
  end