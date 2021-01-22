# This is my standard library where I can use methods in different projects

require_relative '../lang/en.rb'

def clear
  system('clear')
end

def take_it
  gets.chomp.strip
end

def line_return(num = 1)
  num.times { print "\n" }
end

def wait_for_user
  gets.chomp
end

def yes
  %w[yes y]
end

def no
  %w[no n]
end

def animate(str, speed)
  str.to_s
  str.split('').each do |i|
    print i
    sleep(speed)
  end
end

def make_cardinal(num)
  case num
  when 1
    "#{num}st"
  when 2
    "#{num}nd"
  when 3
    "#{num}rd"
  else
    "#{num}th"
  end
end

def continue?
  line_return
  print enter_to_continue
  wait_for_user
end

def show_error?(err, text)
  puts err if err == text
end
