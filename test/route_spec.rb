require_relative '../router/route.rb'
require 'rspec'
require 'rspec/expectations'
describe Routes do
    context 'Given Source and Destination' do
        it 'Find Direct Route' do
            expected = {:time => 1.0, :stops => 0.0}
            items = Array.new
            route = Hash[source: 'A', destination: 'B', weight: 1]
            items.push(route)
            router = Routes.new('')
            router.setRoute(items)
            expect(router.route('A','B')).to eq(expected)
        end
        it 'Find Indirect Route' do
                expected = {:time => 1.0, :stops => 1.0}
                items = Array.new
                route1 = Hash[source: 'A', destination: 'B', weight: 1]
                items.push(route1)
                route2 = Hash[source: 'B', destination: 'C', weight: 1]
                items.push(route2)
                router = Routes.new('')
                router.setRoute(items)
                expect(router.route('A','C')).to eq(expected)
        end
        it 'Find Non-Existent Route 1' do
            expected = {:time => 0.0, :stops => 0.0}
            items = Array.new
            route1 = Hash[source: 'A', destination: 'B', weight: 1]
            items.push(route1)
            route2 = Hash[source: 'B', destination: 'J', weight: 1]
            items.push(route2)
            router = Routes.new('')
            router.setRoute(items)
            expect(router.route('A','D')).to eq(expected)
        end
        it 'Find Non-Existent Route 2' do
            expected = {:time => 0.0, :stops => 0.0}
            items = Array.new
            route1 = Hash[source: 'A', destination: 'B', weight: 1]
            items.push(route1)
            route2 = Hash[source: 'C', destination: 'D', weight: 1]
            items.push(route2)
            router = Routes.new('')
            router.setRoute(items)
            expect(router.route('A','D')).to eq(expected)
        end

    end
end