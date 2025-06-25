require 'spec_helper'

describe BrowseAi::DSL::Robots do
  # GET /robots
  describe '#get_robots' do
    it 'returns an array of robots' do
      VCR.use_cassette('get_robots') do
        robots = BrowseAi.client.get_robots
        expect(robots).to be_a(Array)
        expect(robots.first).to be_a(Robot)
      end
    end
  end

  # GET /robots/{id}
  describe '#get_robot' do
    it 'returns an robot' do
      id = VCR.use_cassette('get_robots') do
        robots = BrowseAi.client.get_robots
        robots.first['id']
      end

      VCR.use_cassette('get_robot') do
        expect(BrowseAi.client.get_robot(id:)).to be_a(Robot)
      end
    end
  end
end
