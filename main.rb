#!/usr/bin/ruby
require 'io/console'
require_relative 'router/route.rb'
require_relative 'switch/argument.rb'

argProcessor = Argument.new
parameters = argProcessor.preprocess
routes = Routes.new(parameters[:path])
source = ''
destination = ''
if parameters[:source] == '' && parameters[:destination] == ''
    print 'What station are you getting on the train?:'
    source = STDIN.gets.chomp
    print 'What station are you getting off the train?:'
    destination = STDIN.gets.chomp  
elsif parameters[:help]
    puts 'use --file= to indicate your file path, this is mandatory'
    puts 'use --source to indicate the original station, this is optional'
    puts 'use --destination to indicate destination station, this is optional'
    puts 'user --help to print user\'s guide'
    exit
else 
    source = parameters[:source]
    destination = parameters[:destination]
end

journeySummary = routes.route(source,destination)

if journeySummary[:stop] == 0.0 && journeySummary[:time] == 0.0
    puts "No route from #{source} to #{destination}."
else
    puts "Your trip from #{source} to #{destination} includes #{journeySummary[:stops]} stops and will take #{journeySummary[:time]} minutes."
end