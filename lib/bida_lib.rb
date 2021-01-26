# This is my standard library where I can use methods in different projects

YES = %w[yes y].freeze
NO = %w[no n].freeze

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

def continue
  line_return
  print 'press ENTER to continue '
  wait_for_user
end

def show_error(err, text)
  puts err if err == text
end
