require 'bundler/setup'
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)


def welcome
  clear_screen
  creator = Adventurer.new({name: 'blnkt', password: 'hey', bio: "Content&Code", fave: 'The Princess Bride', avatar: '??????????'})
	puts "It's time for adventuring.  What's your name?"
	name = gets.chomp
  unless Adventurer.name_checker(name) == true
    new_user(name)
    welcome
  else
    puts "Please enter your password:"
    password = gets.chomp
    unless Adventurer.find_by_user(name, password) == nil
      @user = Adventurer.find_by_user(name, password)
      @user_adventure = Adventure.new({name: @user.name})
      @user.adventures << @user_adventure 
    else
      welcome
    end
  end
    prologue_runner(@user, @user_adventure)
    menu(0, @user_adventure.id)
end

def prologue_runner(user, user_adventure)
  prologue = Chapter.new({id: "0", prompt: "#{user.name}'s Adventure", :episode => "You awake in a field.  You're clear headed but you remember nothing.  Gaping about, you discover a bicycle, a set of keys, and a baseball hat."})
  user_adventure.add_chapter(0)
  prologue.add_choice("Walk the bike out of the field to a nearby road", user_adventure.id)
  user_adventure.add_chapter(1)
  prologue.add_choice("pick up the keys and walk to the road", user_adventure.id)
  user_adventure.add_chapter(2)
  prologue.add_choice("Put on the hat and head towards the sound of water", user_adventure.id)
  user_adventure.add_chapter(3)
end

def menu(chapter_id, adventure_id)
  clear_screen
  chapter = Chapter.find_by_id(chapter_id)
  adventure = Adventure.find_by_id(adventure_id)
  puts chapter.prompt
  linebreak
  puts chapter.episode 
  linebreak
  chapter.choices.each do |choice|
  puts Chapter.find_by_id(choice).id.to_s + ": " + Chapter.find_by_id(choice).prompt
  linebreak
  end
  puts "Enter 'choice number' to proceed"
  puts "Enter 'ac' to add an additional choice"
  puts "Enter '<' to turn back"
  puts "Enter 'p' to view your profile"
  puts "Enter 'x' to leave the adventure"
  choice_id = gets.chomp
  if choice_id == 'x'
    exit
  elsif choice_id == 'ac'
    puts "Enter a new choice for this chapter:"
    choice_text = gets.chomp
    chapter.add_choice(choice_text, adventure_id)
  elsif choice_id == 'ae'
    puts "Enter an episode for this chapter:"
    episode = gets.chomp
	  chapter.add_episode(episode)
    puts chapter.id
  elsif choice_id == 'p'
    profile(adventure.name)
  elsif Chapter.find_by_id(choice_id) != nil
    adventure.add_chapter(choice_id)
    menu(choice_id, adventure_id)
	else
	  menu(chapter.id, adventure_id)
  end
  menu(chapter.id, adventure_id)
end 

def new_user(name)
  puts "Looks like this is your first adventure.  Let's create a profile using #{name} as your username."
  user = Adventurer.new(name: name)
  prologue_runner(user, user.first_adventure)
  new_password(user)
  menu(0, user.first_adventure.id)

end

def new_password(user)
  puts "\nEnter a new password so your adventure stays all your own:"
  password1 = gets.chomp
  puts "Please reenter your password:"
  if password1 == gets.chomp
    user.add_password(password1)
    puts "Thank you for joining the adventure.  Enter your name and password when prompted."
    sleep 2
  else
    puts "Sorry those passwords don't match."
    sleep 2
    new_password(user)
  end
end

def profile_verification (username)
  puts "#{username.upcase}, please enter your password:"
  password = gets.chomp
  account = Adventurer.find_by_user(username, password)
  return account
end

def profile name
  username = name
  clear_screen
  account = profile_verification(username)
  loop do
    puts "Looks like your profile is incomplete."
    if account.avatar == nil
      new_avatar(account) if account.avatar == nil
    elsif account.bio == nil 
      new_bio(account) if account.bio == nil
    elsif account.fave == nil
      new_fave(account) if account.fave == nil
    else
      clear_screen
      break
    end
  end
  puts account.name.upcase
  puts account.avatar
  puts "Bio:" + account.bio
  puts "My favorite adventure:" + account.fave
  puts "Enter 'a' to edit your avatar"
  puts "Enter 'b' to edit your biography"
  puts "Enter 'f' to edit your favorite adventure (book, movie, life, etc.)"
  puts "Enter 'm' to return to the adventure"
  case gets.chomp
  when 'a'
    new_avatar(account)
  when 'b'
    new_bio(account)
  when 'f'
    new_fave(account)
  when 'm'
    menu(0, account.first_adventure)
  else
    profile(username)
  end
  profile(username)
end

def new_avatar account
  puts "Enter 'human', 'bear', 'penguin', 'joker', or 'kazoo' to select an avatar, or type in your own ASCII"
  account.add_avatar(gets.chomp)

end

def new_bio account
  puts "Enter a short biography:"
  account.add_bio(gets.chomp)
end

def new_fave account
  puts "Enter your favorite adventure:"
  account.add_fave(gets.chomp)
end

def clear_screen
  puts "\e[H\e[2J"
end

def linebreak
	puts "\n"
end

# menu
welcome