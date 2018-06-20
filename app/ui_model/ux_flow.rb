require_relative "./prompts.rb"
require_relative "./menus.rb"
require_relative './validation'
#require_all 'app'

def runner
  username = nil
  name = nil
  welcome
  if new_or_old_prompt == "Yes"
    while username == nil
      username = is_username_valid?(username_prompt)
    end
    while name == nil
      name = is_name_valid?(create_account_prompt)
    end
    acct_owner = Owner.create(name: name, username: username)
  else
    while username == nil
      username = does_user_exist?(username_prompt)
    end
    acct_owner = Owner.find_by(username: username)
  end
  #owner_menu_prompt
  main_menu(acct_owner)
  walker_menu(acct_owner)

end
