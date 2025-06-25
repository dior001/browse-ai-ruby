require 'spec_helper'

describe BrowseAi::DSL::Monitors do
  def robot_id
    VCR.use_cassette('get_robots') do
      robots = BrowseAi.client.get_robots
      robots.first['id']
    end
  end

  # GET /monitors
  describe '#get_monitors' do
    it 'returns an array of monitors' do
      VCR.use_cassette('get_monitors') do
        monitors = BrowseAi.client.get_monitors(robot_id:)
        expect(monitors).to be_a(Array)
        expect(monitors.first).to be_a(Monitor)
      end
    end
  end

  # GET /monitors/{id}
  describe '#get_monitor' do
    it 'returns an monitor' do
      id = VCR.use_cassette('get_monitors') do
        monitors = BrowseAi.client.get_monitors(robot_id:)
        monitors.first['id']
      end

      VCR.use_cassette('get_monitor') do
        expect(BrowseAi.client.get_monitor(robot_id:, id:)).to be_a(Monitor)
      end
    end
  end
end
