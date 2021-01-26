# This is my standard library where I can use methods in different projects

def clear
  system('clear')
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

def show_error(err, text)
  err if err == text
end
