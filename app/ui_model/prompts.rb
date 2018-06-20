require 'tty-prompt'

#prompt = TTY::Prompt.new

def welcome
  puts <<-WELCOME
  WELCOME TO
  ▄         ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄       ▄         ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄            ▄    ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄
 ▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌     ▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░▌          ▐░▌  ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌
 ▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀      ▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀█░▌▐░▌          ▐░▌ ▐░▌ ▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌
 ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░▌               ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌          ▐░▌▐░▌  ▐░▌          ▐░▌       ▐░▌
 ▐░▌   ▄   ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄▄▄      ▐░▌   ▄   ▐░▌▐░█▄▄▄▄▄▄▄█░▌▐░▌          ▐░▌░▌   ▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌
 ▐░▌  ▐░▌  ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌     ▐░▌  ▐░▌  ▐░▌▐░░░░░░░░░░░▌▐░▌          ▐░░▌    ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌
 ▐░▌ ▐░▌░▌ ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀▀▀      ▐░▌ ▐░▌░▌ ▐░▌▐░█▀▀▀▀▀▀▀█░▌▐░▌          ▐░▌░▌   ▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀█░█▀▀
 ▐░▌▐░▌ ▐░▌▐░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░▌               ▐░▌▐░▌ ▐░▌▐░▌▐░▌       ▐░▌▐░▌          ▐░▌▐░▌  ▐░▌          ▐░▌     ▐░▌
 ▐░▌░▌   ▐░▐░▌▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌▐░▌               ▐░▌░▌   ▐░▐░▌▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░▌ ▐░▌ ▐░█▄▄▄▄▄▄▄▄▄ ▐░▌      ▐░▌
 ▐░░▌     ▐░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌               ▐░░▌     ▐░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░▌  ▐░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌
  ▀▀       ▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀                 ▀▀       ▀▀  ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀    ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀

  WELCOME
end

def new_or_old_prompt
  prompt = TTY::Prompt.new
  prompt.select("Are you a new user?", %w(Yes No))
end

def is_e_user_prompt
  prompt = TTY::Prompt.new
  prompt.ask("Please enter your username")
  #error message raise?
end

def create_account_prompt
  prompt = TTY::Prompt.new
  prompt.ask("What is your name?")
end

def owner_menu_prompt
  prompt = TTY::Prompt.new
  prompt.select('What would you like to do?') do |menu|
    menu.choice "View my dogs", 1
    menu.choice "Add a new dog", 2
    menu.choice "View my walkers", 3
    menu.choice "Find a walker", 4
    menu.choice "I'm a dog walker!", 5
    menu.choice "View my Personal Info", 6
    menu.choice "Logout", 7
  end
end

def dog_name_prompt
  prompt = TTY::Prompt.new
  prompt.ask("What is your dog's name?")
  #error message raise?
end

def dog_breed_prompt
  prompt = TTY::Prompt.new
  prompt.ask("What is your dog's breed?")
  #error message raise?
end

def dog_size_prompt
  prompt = TTY::Prompt.new
  prompt.select("How big is your dog?", %w(Small Medium Large))
  #error message raise?
end

def username_prompt
  prompt = TTY::Prompt.new
  prompt.ask("Please Enter a username:")
end

def walker_menu_prompt
  prompt = TTY::Prompt.new
  prompt.select('What would you like to do?') do |menu|
    menu.choice "View my rates", 1
    menu.choice "Change my rate for small dogs", 2
    menu.choice "Change my rate for medium dogs", 3
    menu.choice "Change my rate for large dogs", 4
    menu.choice "See which dogs I've Walked!", 5
    menu.choice "See who I've worked for", 6
    menu.choice "Go Back", 7
  end
end

def rate_change_prompt
  prompt = TTY::Prompt.new
  prompt.ask("What would you like the new rate to be?")
end

def walker_view_prompt(walk_arr)
  prompt = TTY::Prompt.new
  prompt.select('Choose a walker!', walk_arr)
end

def choose_dog_prompt(dog_arr)
  prompt = TTY::Prompt.new
  prompt.select('Choose a dog!', dog_arr)
end

def book_walk_prompt
  prompt = TTY::Prompt.new
  prompt.select("Do you want to book this walk?", %w(Yes No))
end
