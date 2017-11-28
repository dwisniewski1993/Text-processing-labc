#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'

URI_REGEX = %r"((?:(?:[^ :/?#]+):)(?://(?:[^ /?#]*))(?:[^ ?#]*)(?:\?(?:[^ #]*))?(?:#(?:[^ ]*))?)"

def remove_uris(text)
  text.split(URI_REGEX).collect do |s|
    unless s =~ URI_REGEX
      s
    end
  end.join
end

argument1 = ARGV[0]
argument2 = ARGV[1]
article_list = Array.new

puts "Pierwszy argument to #{argument1}, a drugi to #{argument2}"

DATA_DIR = "data-hold/nobel"
Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)

BASE_WIKIPEDIA_URL = "https://en.wikipedia.org"
LIST_URL = "#{BASE_WIKIPEDIA_URL}/wiki/List_of_Nobel_laureates"

HEADERS_HASH = {"User-Agent" => "Ruby/#{RUBY_VERSION}"}

page = Nokogiri::HTML(open(LIST_URL))
rows = page.css('div.mw-content-ltr table.wikitable tr')

rows[1..-2].each do |row|

  hrefs = row.css("td a").map{ |a|
    a['href'] if a['href'] =~ /^\/wiki\//
  }.compact.uniq

  hrefs.each do |href|
    remote_url = BASE_WIKIPEDIA_URL + href
    local_fname = "#{DATA_DIR}/#{File.basename(href)}.html"
    if (remote_url=~/#{argument1}/)
      #puts "#{remote_url} zawiera #{argument1}"
      article_list.push(local_fname)
      unless File.exists?(local_fname)
        puts "Fetching #{remote_url}..."
        begin
          wiki_content = open(remote_url, HEADERS_HASH).read
        rescue Exception=>e
          puts "Error: #{e}"
          sleep 5
        else
          File.open(local_fname, 'w'){|file| file.write(wiki_content)}
          puts "\t...Success, saved to #{local_fname}"
        ensure
          sleep 1.0 + rand
        end  # done: begin/rescue
      end # done: unless File.exists?
    end

  end # done: hrefs.each
end # done: rows.each

for each in article_list
  #puts each
  title = open("#{each}").read.scan(/<title>(.*?)<\/title>/)
  file = File.new("#{each}", "r")
  puts title
  while (line = file.gets)
    line = line.gsub(/<\/?[^>]*>/, '').gsub(/\n\n+/, "\n").gsub(/^\n|\n$/, '')
    if (argument2!=nil)
      if (line =~ /#{argument2}/)
        line = remove_uris(line)
        puts line
      end
    else
      puts "Nie podano drugiego argumentu"
      break
    end # done: check arg2
  end # done: while
  puts "---------------------------------------------"
end # done: article_list.each
