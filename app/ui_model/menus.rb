
def main_menu(acct_owner)
  loop do
    case owner_menu_prompt
    when 1
      has_dogs_check(acct_owner)
      acct_owner.view_dog_instances.map do |dog|
        puts "#{dog.name} - a #{dog.size} #{dog.breed} and a good doggo!"
      end.join(", ")
    when 2
      dog_name = is_this_blank?(dog_name_prompt)
      breed = is_this_blank?(dog_breed_prompt)
      size = dog_size_prompt
      dog = acct_owner.add_dog(name: dog_name, breed: breed, size: size)
      puts "#{dog.name} is a #{dog.size} #{dog.breed} and such a good doggo!"
    when 3
      has_dogs_check(acct_owner)
      has_walks_check(acct_owner)
      selected_walk = choose_walk_prompt(acct_owner.view_my_walkers)
      rating = walk_rating_prompt
      if rating < 6
          selected_walk.update(rating: rating)
          selected_walk.walker.rating_average
          puts "Thanks for using Woof Walker!"
      end
    when 4
      has_dogs_check(acct_owner)
      selected_walker = walker_view_prompt(acct_owner.look_for_walkers)
      selected_dog = choose_dog_prompt(acct_owner.select_dog_for_walk(selected_walker))
      if book_walk_prompt == "Yes"
        date = nil
        while date == nil
          date = date_valid?(book_walk_date_prompt)
        end
        selected_dog.book_a_walk(selected_walker, date)
        puts "Booked walk for #{selected_dog.name} with #{selected_walker.name} on #{date.strftime("%B %d, %Y")}!"
      else
        main_menu(acct_owner)
      end
    when 5
      acct_walker = acct_owner.become_walker
      walker_menu(acct_walker)
    when 6
      puts "Name: #{acct_owner.name}"
      puts "Username: #{acct_owner.username}"
    when 7
      if log_out_prompt == "Quit"
        exit
      else
        runner
      end
    end
  end
end

def walker_menu(acct_walker)
  loop do
    case walker_menu_prompt
    when 1
      puts "Your rating is #{acct_walker.display_rating}."
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
