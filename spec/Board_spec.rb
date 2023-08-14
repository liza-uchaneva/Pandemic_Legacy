require 'Board'
require 'ruby-debug'
require 'spec_helper'

describe 'Board' do 
    describe "findBestSpotForNextStation" do
        it "one node" do
            map = {"Atlanta" => []}
            stations = ["Atlanta"]
            board = Board.new(map)

            expected_result = []
            result = board.findBestSpotForNextStation(stations)

            expect(result).to eql(expected_result)
        end
    end

    describe "findBestSpotForNextStation" do
        it "two nodes" do
            map = {"Atlanta" => ["Chicago"], 
                "Chicago" => ["Atlanta"]}
            stations = ["Atlanta"]
            board = Board.new(map)
        
            expected_result = ["Chicago"]
            result = board.findBestSpotForNextStation(stations)

            expect(result).to eql(expected_result)
        end
    end

    describe "findBestSpotForNextStation" do
        it "long line graph" do
            map = {"Atlanta" => ["Chicago"], 
                    "Chicago" => ["Atlanta", "Miami"], 
                    "Miami" => ["Chicago", "Washington"],
                    "Washington" => []
            }
            stations = ["Atlanta"]
            board = Board.new(map)
        
            expected_result = ["Washington"]
            result = board.findBestSpotForNextStation(stations)

            expect(result).to eql(expected_result)
        end
    end

    describe "findBestSpotForNextStation" do
        it "one root multipal children" do
            map = {"Atlanta" => ["Chicago", "Miami", "Washington"],
                    "Chicago" => ["Atlanta"], 
                    "Miami" => ["Atlanta"],
                    "Washington" => ["Atlanta"]
            }
            stations = ["Atlanta"]
            board = Board.new(map)
        
            expected_result = ["Chicago", "Miami", "Washington"]
            result = board.findBestSpotForNextStation(stations)

            expect(result).to eql(expected_result)
        end
    end
end