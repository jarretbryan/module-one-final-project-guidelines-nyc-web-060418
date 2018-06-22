# Woof Walker

Woof Walker™ is a dog walking application that runs from your command line. You can create an account, add dogs to your account, and book walks for your dogs with our network of Woof Walkers™ based on rating and price. You can also sign in as a Walker and set your own prices.

[Link to Short Demo](https://youtu.be/c9E8vD54A30)

## Contents
+ [Installing](##installing)
+ [Login or Create a new user](##login-or-create-a-new-user)
  * [New User](###new-user)
  * [Existing User](###existing-user)
+ [Navigating Main Menu](##navigating-main-menu)
  * [View my dogs](###view-my-dogs)
  * [Add a new dog](###add-a-new-dog)
  * [View walk history](###add-a-new-dog)
  * [Find a walker](###find-a-walker)
  * [I'm a dog walker!](###i'm-a-dog-walker!)
  * [View my personal info](###view-my-personal-info)
  * [Logout](###logout)
+ [Navigating Dog Walker Menu](##navigating-dog-walker-menu)
  * [View my rates](###view-my-rates)
  * [Change my rate for small dogs](###change-my-rate-for-small-dogs)
  * [Change my rate for medium dogs](###change-my-rate-for-medium-dogs)
  * [Change my rate for large dogs](###change-my-rate-for-large-dogs)
  * [See which dogs I've walked!](###see-which-dogs-i've-walked!)
  * [See who I've worked for](###see-who-i've-worked-for)
+ [Contributing](##contributing)
+ [License](##license)


## Installing
1. Clone the repo down to your local machine
2. from the folder, run ```$ bundle install```
3. run ```rake db:migrate``` and ```rake db:seed``` to populate the database.
4. run ```ruby bin/run.rb``` to start the program! You can now start booking walks for your dogs!

## Login or Create a new user
Once you open the app, your greeted with a warm welcome logo then prompt to select whether they are a new user or an existing user.
### New User
To sign up, we'll need just two pieces of information. Create a valid username and enter your name.
No funny business though, because our state of the art validation system will check for invalid entries.
### Existing User
If you've already signed up, then just enter your username and you're ready to book a Woof Walkers™.
## Navigating Main Menu
Navigating through the main menu is very simple and intuitive, because we're great programmers, and largely due to the limited amount of selections available.
### View my dogs
In the "View my dogs" menu option, you can view all the dogs that are associated to your account.
### Add a new dog
This is where you'll add dogs to your account. We know you're wondering "how do I delete dogs?" Well, you can't because that's wrong. Plus, who would ever want to delete their dog?
### View walk history
In this menu option, you can view a full history of all the walks your pup has been on. If your pup loved a particular walk, you can view who the walker was and give them a 5 star rating!
### Find a walker
This is where you'll go if your doggos need to go on a nice walk. Our expansive network of fantastic Woof Walkers™ is ready to walk your furiends.
### I'm a dog walker!
Love walking dogs and want to make some extra $? Select here to sign up to be a Woof Walkers™. You can set your own rates, view all the walks you've been on, and also see who their doggy parents are.
### View my personal info
Forgot your name or username? Come here.
### Logout
This is where you login, but the opposite.

## Navigating Dog Walker
Once you've signed up to become a Woof Walkers™, you'll have access to this walker menu.
### View my rates
Check what your current rating and walk rates are.
### Change my rate
Set your rate for walking small, medium, and large dogs.
### See which dogs I've walked!
View your furiends.
### See who I've worked for
View their pawrents.

## Contributing
1. Fork the repo
2. Create your feature branch
3. Commit your changes
4. Push to branch
5. Create new Pull Request

## License
This code is free to use under the terms of the MIT license. See [LICENSE](../blob/master/LICENSE) for details.
