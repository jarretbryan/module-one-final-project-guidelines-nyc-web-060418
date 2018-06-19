require_relative "./prompts.rb"


def runner
  welcome
  if new_or_old_prompt == "Yes"
    username = username_prompt
    name = create_account_prompt
    Owner.create(name: name, username: username)
  else
    username = username_prompt
    Owner.find_by(username)
  end
  owner_menu_prompt

end
