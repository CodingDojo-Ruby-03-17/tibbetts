def puts_three
  i = 1
  puts i+=1
end

def aye
  yield
end

aye { puts_three } 
