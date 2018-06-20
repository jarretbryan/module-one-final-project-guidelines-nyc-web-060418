
def main_menu(acct_owner)
  loop do
    case owner_menu_prompt
    when 1
      acct_owner.view_dog_instances.map do |dog|
        puts "#{dog.name} - a #{dog.size} #{dog.breed} and a good doggo!"
      end.join(", ")
    when 2
      dog_name = dog_name_prompt
      breed = dog_breed_prompt
      size = dog_size_prompt
      dog = acct_owner.add_dog(name: dog_name, breed: breed, size: size)
      puts dog.name
    when 3
      puts acct_owner.view_my_walkers.join(", ")
    when 4
      selected_walker = walker_view_prompt(acct_owner.look_for_walkers)
      selected_dog = choose_dog_prompt(acct_owner.select_dog_for_walk(selected_walker))
      if book_walk_prompt == "Yes"
        walk = selected_dog.book_a_walk(selected_walker)
        puts "#{selected_dog.name} went for a walk with #{selected_walker.name}!"
        rating = walk_rating_prompt
        if rating < 6
          #binding.pry
          walk.update(rating: rating)
          selected_walker.rating_average
          puts "Thanks for walking #{selected_dog.name} with Woof Walker!"
        end
      else
        main_menu(acct_owner)
      end
    when 5
      acct_owner.become_walker
      break
    when 6
      puts "Name: #{acct_owner.name}"
      puts "Username: #{acct_owner.username}"
    when 7
      puts "Goodbye!"
      exit
    end
  end
end

def walker_menu(acct_walker)
  loop do
    case walker_menu_prompt
    when 1
      puts "Your rating is #{acct_walker.rating_average}."
      puts "You charge $#{acct_walker.small_dog_rate} for small dogs."
      puts "You charge $#{acct_walker.medium_dog_rate} for medium dogs."
      puts "You charge $#{acct_walker.large_dog_rate} for large dogs."
    when 2
      acct_walker.update(small_dog_rate: rate_change_prompt)
    when 3
      acct_walker.update(medium_dog_rate: rate_change_prompt)
    when 4
      acct_walker.update(large_dog_rate: rate_change_prompt)
    when 5
        acct_walker.indv_dogs.each do |dog|
          puts "#{dog.name}, a #{dog.size} #{dog.breed}."
        end
    when 6
      acct_walker.indv_owners.uniq.each do|owner|
        puts "#{owner.name}, a stand up citizen."
      end
    when 7
      main_menu(acct_walker.owner)
    end
  end
end
