require 'tty-prompt'

def welcome
  puts "Welcome to WOOOOOOOOF!!!"
end

def create_owner_account
  prompt = TTY::Prompt.new
  name = prompt.ask("Let's get you started. What is your name?")
  new_owner = Owner.create(name: name)
end
