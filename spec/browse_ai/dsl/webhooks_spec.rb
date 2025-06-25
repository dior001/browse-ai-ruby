require 'spec_helper'

describe BrowseAi::DSL::Webhooks do
  def robot_id
    VCR.use_cassette('get_robots') do
      robots = BrowseAi.client.get_robots
      robots.first['id']
    end
  end

  # GET /webhooks
  describe '#get_webhooks' do
    it 'returns an array of webhooks' do
      VCR.use_cassette('get_webhooks') do
        webhooks = BrowseAi.client.get_webhooks(robot_id:)
        expect(webhooks).to be_a(Array)
        expect(webhooks.first).to be_a(Webhook)
      end
    end
  end
end
