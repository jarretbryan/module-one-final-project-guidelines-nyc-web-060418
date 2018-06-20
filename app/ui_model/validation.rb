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

def is_name_valid?(name)
  if name == nil
    puts "Name cannot be blank"
  else
    name
  end
end

def does_user_exist?(username)
  if Owner.find_by(username: username) == nil
    puts "User does not exist, please try again"
  else
    username
  end
end
