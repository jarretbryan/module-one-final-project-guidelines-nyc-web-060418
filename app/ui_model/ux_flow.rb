require_relative "./prompts.rb"
#require_all 'app'


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
  loop do
    case owner_menu_prompt
    when 1
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
      p acct_owner.look_for_walkers
    when 5
      p "congrats!"
    when 6
      p "Goodbye!"
      break
    end
  end


end
