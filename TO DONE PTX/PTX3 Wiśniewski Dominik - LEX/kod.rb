#!/usr/bin/env ruby

class MyClass
 name = "SomeName"

 def f(x = 4, i = 5, m = 3, e = 2)
  for i in 10..20
   puts i
  end
  if x > 0
   return x
  elsif x < 0
   return m
  else
   return e
  end
 end
end

instance = MyClass.new
q = instance.f()
puts q
