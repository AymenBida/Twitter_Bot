# This file contains the messages sent to the user to interact with the bot
# This way we can easily translate the app to other languages

require 'colorize'

def greeting
  'Welcome to "Twitter Bot" by Aymen Bida'
end

def ask_for(key)
  "Please copy and paste your -#{key}- here and press ENTER:"
end

def introduction
  """This bot has two main functionalities: auto_tweet and tweet_now :

  - tweet_now :
  You get to write a tweet and it will be tweeted right away

  - auto_tweet :
  You get to write a tweet and choose how many times you want it to be tweeted and at which interval"""
end

def enter_to_continue
  "Press ENTER to continue "
end

def choose_mode
  """Choose the bot functionality:

[1] tweet_now
[2] auto_tweet

Write 1 or 2 and press ENTER:"""
end

def type_message
  "Type the message that you want to tweet right away:"
end

def sure?
  'Are you sure you want to tweet this?'
end

def yes
  ['yes', 'y']
end

def no
  ['no', 'n']
end

def your_tweet(tweet)
  """Your tweet is going to be:

  - #{tweet}

Do you want to confirm or to tweet something else ?

[1] confirm
[2] something else"""
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
  'Thank you for your time'
end

# Errors next ------------------------------------------------------------------------

def not_in_range(a, b)
  "Please choose a number between #{a} and #{b}.".yellow
end

def no_message
  "Please don't leave it blank, write something ^^".yellow
end