module MyEnumerable

  def my_map
    for i in (0...self.length)
      self[i] = yield self[i]
    end
  end
  
  ## my_map alternative ###
  #def my_map
  #  for i in self
  #    i = yield i
  #  end
  #end

  def my_each
    for i in self
      yield i 
    end
  end

end

class Array
  include MyEnumerable
end
a = [1,2,3,4]
a.my_map { |i| i**2 }
a.my_each { |i| puts i }
