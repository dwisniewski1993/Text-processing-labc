#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'


argument1 = ARGV[0]
argument2 = ARGV[1]
article_list = Array.new

puts "Pierwszy argument to #{argument1}, a drugi to #{argument2}"

BASE_WIKIPEDIA_URL = "https://en.wikipedia.org"
LIST_URL = "#{BASE_WIKIPEDIA_URL}/wiki/List_of_Nobel_laureates"

page = Nokogiri::HTML(open(LIST_URL))

rows = page.css('td a')

rows.each do |line|
	if line.text =~ /#{argument1}/
		article_list.push(line['href'])
	end
end

for url in article_list
	used_url = "#{BASE_WIKIPEDIA_URL}#{url}"
	article = Nokogiri::HTML(open(used_url))
	article_table = article.css('table')[0]
	article_info = article_table.css('tr')
	counter = 0
	article_info.each do |tr|
		if counter == 0
			puts tr.text
		end
		if tr.text =~ /#{argument2}/
			puts tr.text
		end
	counter =+1
	end
	puts "***************************************************"
end
