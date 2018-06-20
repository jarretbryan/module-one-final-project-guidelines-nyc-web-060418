
def main_menu(acct_owner)
  loop do
    case owner_menu_prompt
    when 1
      #binding.pry
      acct_owner.view_dog_instances.map do |dog|
        p "#{dog.name} - a #{dog.size} #{dog.breed} and a good doggo!"
      end.join(", ")
    when 2
      dog_name = dog_name_prompt
      breed = dog_breed_prompt
      size = dog_size_prompt
      dog = acct_owner.add_dog(name: dog_name, breed: breed, size: size)
      puts dog.name
    when 3
      p acct_owner.view_my_walkers.join(", ")
    when 4
      selected_walker = walker_view_prompt(acct_owner.look_for_walkers)
      selected_dog = choose_dog_prompt(acct_owner.select_dog_for_walk(selected_walker))
      if book_walk_prompt == "Yes"
        selected_dog.book_a_walk(selected_walker)
        puts "#{selected_dog.name} went for a walk with #{selected_walker.name}!"
      else
        main_menu(acct_owner)
      end
    when 5
      p "congrats!"
      break
    when 6
      p "Name: #{acct_owner.name}"
      p "Username: #{acct_owner.username}"
    when 7
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
