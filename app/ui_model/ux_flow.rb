require_relative "./prompts.rb"
#require_all 'app'

def main_menu(acct_owner)
  loop do
    case owner_menu_prompt
    when 1
      #binding.pry
      p acct_owner.view_dogs.join(", ")
    when 2
      dog_name = dog_name_prompt
      breed = dog_breed_prompt
      size = dog_size_prompt
      dog = acct_owner.add_dog(name: dog_name, breed: breed, size: size)
      puts dog.name
    when 3
      p acct_owner.view_my_walkers
    when 4
      selected_walker = walker_view_prompt(acct_owner.look_for_walkers)
      selected_dog = choose_dog_prompt(acct_owner.select_dog_for_walk(selected_walker))
    when 5
      p "congrats!"
      break
    when 6
      p "Goodbye!"
      exit
    end
  end
end

def walker_menu(acct_owner)
  loop do
    case walker_menu_prompt
    when 1
      # p Walker.small_dog_rate
      # p Walker.medium_dog_rate
      # p Walker.big_dog_rate
    when 2
    #  Walker.small_dog_rate = rate_change_prompt
    when 3
      #Walker.medium_dog_rate = rate_change_prompt
    when 4
      #Walker.big_dog_rate = rate_change_prompt
    when 5
      #Walker.dogs
    when 6
      #Walker.owners
    when 7
      main_menu(acct_owner)
    end
  end
end


def runner
  welcome
  if new_or_old_prompt == "Yes"
    username = username_prompt
    name = create_account_prompt
    acct_owner = Owner.create(name: name, username: username)
  else
    username = username_prompt
    acct_owner = Owner.find_by(username: username)
  end
  #owner_menu_prompt
  main_menu(acct_owner)
  walker_menu(acct_owner)

end
