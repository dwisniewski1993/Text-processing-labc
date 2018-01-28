#!/usr/bin/env python3

class MyClass:
 name = "SomeName"
	
 def f(self, x = 4, i = 5, m = 3, e = 2):
  for i in range(10):
   print(i)
  if x > 0:
   return x
  elif x < 0:
   return m
  else:
   return e

instance = MyClass()
q = instance.f()
print(q)
