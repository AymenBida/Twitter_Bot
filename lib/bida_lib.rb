# This is my standard library where I can use methods in different projects

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
    res = "#{num}st"
  when 2
    res = "#{num}nd"
  when 3
    res = "#{num}rd"
  else
    res = "#{num}th"
  end
  res
end
