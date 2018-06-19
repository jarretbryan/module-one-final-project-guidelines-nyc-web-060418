require 'tty-prompt'

#prompt = TTY::Prompt.new

def welcome
  puts "Welcome to WOOOOOOOOF!!!"
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
  prompt.ask("Let's get you started. What is your name?")
end

def owner_menu_prompt
  prompt = TTY::Prompt.new
  prompt.select('What would you like to do?') do |menu|
    menu.choice "View my dogs", 1
    menu.choice "Add a new dog", 2
    menu.choice "View previous walkers", 3
    menu.choice "I'm a dog walker!", 4
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
