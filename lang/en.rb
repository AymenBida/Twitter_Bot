# This file contains the messages sent to the user to interact with the bot
# This way we can easily translate the app to other languages

require 'colorize'

def greeting
  "Welcome to \e[36m\e[1m\"Twitter Bot\"\e[22m\e[0m by Aymen Bida
Before we proceed, please configure your bot by entering your API keys and Access Token keys:"
end

def ask_for(key)
  "Please copy and paste your -\e[33m\e[1m#{key}\e[22m\e[0m- here and press ENTER:"
end

def introduction
  "This bot has two main functionalities: auto_tweet and tweet_now :

  - tweet_now :
  You get to write a tweet and it will be tweeted right away

  - auto_tweet :
  You get to write a tweet and choose how many times you want it to be tweeted and at which interval"
end

def enter_to_continue
  'Press ENTER to continue '
end

def choose_mode
  "Choose the bot functionality:

\e[32m\e[1m[1]\e[22m\e[0m tweet_now
\e[32m\e[1m[2]\e[22m\e[0m auto_tweet

Write 1 or 2 and press ENTER:"
end

def type_message
  'Type the message that you want to tweet right away:'
end

def sure?
  'Are you sure you want to tweet this?'
end

def yes
  %w[yes y]
end

def no
  %w[no n]
end

def your_tweet(tweet)
  "Your tweet is going to be:

  - #{tweet}

Do you want to confirm or to tweet something else ?

\e[32m\e[1m[1]\e[22m\e[0m confirm
\e[32m\e[1m[2]\e[22m\e[0m something else"
end

def try_again
  '1 second please...'.yellow
end

def processing
  'Sending your tweet...'
end

def success
  '*** Tadaaa! Your tweet is already there, go check it out! ***'.bold.green
end

def thank_you
  puts '" Thank you for trying my Twitter Bot "'.bold.cyan
  puts 'Aymen Bida'
end

def how_many_times
  'How many times you want your tweet to show ? (between 2 and 10)'
end

def interval?
  'How many minutes do you want between your tweets ? (between 1 and 30)'
end

def sending(num)
  "Sending your #{make_cardinal(num)} tweet..."
end

def waiting_for_interval(num)
  "Waiting for #{num} minutes before the next tweet.."
end

# Warnings ---------------------------------------------------------------------------

def warning
  "\e[33m\e[1m[WARNING]\e[22m\e[0m If any of the following keys is incorrect the application will not work and it will crash
\e[1m[NOTICE]\e[22m Your Access Token should have 'write' permissions for this bot to function"
end

# Errors -----------------------------------------------------------------------------

def not_in_range(arg1, arg2)
  "Please choose a number between #{arg1} and #{arg2}.".bold.red
end

def no_message
  "Please don't leave it blank, write something ^^".bold.red
end
