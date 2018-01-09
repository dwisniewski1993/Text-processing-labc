#!/usr/bin/ruby
# coding: utf-8

# Przygotować narzędzia pomocnicze (użyć języka skryptowego Perl, Ruby, Python, ...):
#  Napisać program kompilujący listę słów do postaci automatu skończonego w formacie OpenFst.

STDERR.puts "Podaj słowo do zamiany:"
while l = gets
  words = l.scan(/[A-Za-z]+/)
  counter_begin = 0
  counter_end = 1
  counter = 1
  words.each do |word|
    word_max_index = word.length - 1
    word.each_char.with_index do |letter, index|
      if index == 0
        print '0'
      else
        print counter
      end
      counter+=1
      print ' '
      if index == word_max_index
        print counter_end
      else
        print counter
      end
      print ' '
      print letter, ' ', letter, "\n"
    end
  end
  puts counter_end
end
