#!/usr/bin/ruby
require 'csv'
require_relative "../file_reader/reader.rb"
class Routes
  $routes = Hash.new

  def initialize(routeFile)
      $routes = prepareData(routeFile)
  end

  def route(source,destination)
    journey = findDirectRoute(source,destination)
    if journey.length() == 0
      journey = findIndirectRoute(source,destination) 
    end
    calculate(journey,destination)
  end

  def setRoute(routes)
    $routes = routes
  end

  private

  def findIndirectRoute(source,destination) 
    currentSource = source 
    routes = Array.new
    while true 
      route = $routes.find{|route| route[:source] == currentSource}
      if !route.nil? && route[:destination] != currentSource 
        currentSource = route[:destination]
        routes.push(route)
      else
        break
      end
    end
    routes
  end
  def findDirectRoute(source,destination)
    directRoute = $routes.select{|route| route[:source] == source && route[:destination] == destination}
    directRoute
  end
  def calculate(journey,destination)
    summary = Hash.new
    if journey.length() > 1 
      intermediateStops = journey[1..]
    else  
      intermediateStops = journey
    end 
    if journey.find{|route| route[:destination] == destination} 
      summary[:time] = intermediateStops.map{|route| route[:weight].to_f}.sum
      summary[:stops] = (journey.length() - 1).to_f
      summary 
    else 
      summary[:time] = 0.0
      summary[:stops] = 0.0
      summary
    end
  end
  def prepareData(filePath)
    if filePath.length() > 0 
      $routes = Reader.parse(filePath)
    end
  end

end
