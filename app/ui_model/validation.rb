
def is_username_valid?(username)
  if Owner.find_by(username: username)
    puts "Username already taken, please choose another username"
    username = nil
  elsif username == nil
    puts "Username cannot be blank"
  else
    return username
  end
end

def is_this_blank?(item)
  if item == nil
    puts "Name cannot be blank"
  else
    item
  end
end

def does_user_exist?(username)
  if Owner.find_by(username: username) == nil
    puts "User does not exist, please try again"
  else
    username
  end
end

def date_valid?(date)
  format = '%m/%d/%Y'
  DateTime.strptime(date, format)
  Date.strptime(date, "%m/%d/%Y")
rescue ArgumentError
  puts "Please enter a valid date MM/DD/YY"
  date = nil
end

def has_dogs_check(acct_owner)
  if acct_owner.view_dog_instances.length == 0
    puts "But you have no dogs!"
    main_menu(acct_owner)
  end
end

def has_walks_check(acct_owner)
  if acct_owner.view_walks.length == 0
    puts "But you haven't booked a walk yet! Plase book one with one of our many great Woof Walkers!!!"
    main_menu(acct_owner)
  end
end
