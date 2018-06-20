require_relative "./prompts.rb"
require_relative "./menus.rb"
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
  main_menu(acct_owner)
  walker_menu(acct_owner)

end
