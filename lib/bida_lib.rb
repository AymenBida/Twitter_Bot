# This is my standard library where I can use methods in different projects

def clear
  system('clear')
end

def get_it
  gets.chomp.strip
end

def line_return(n = 1)
  n.times { print "\n" }
end