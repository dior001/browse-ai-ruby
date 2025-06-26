require 'spec_helper'

describe BrowseAi::DSL::BulkRuns do
  def robot_id
    VCR.use_cassette('get_robots') do
      robots = BrowseAi.client.get_robots
      robots.first['id']
    end
  end

  # POST /robots/{robotId}/bulk-runs
  describe '#bulk_run_tasks' do
    let(:payload) do
      {
        'inputParameters' => {
          'originUrl' => 'Test',
        }
      }.to_json
    end

    it 'creates a bulk run and executes it on the robot' do
      VCR.use_cassette('bulk_run_tasks') do
        bulk_run = BrowseAi.client.bulk_run_tasks(robot_id:, payload:)
        expect(bulk_run).to be_a(BulkRun)
      end
    end
  end

  # GET robots/{robotId}/bulk_runs
  describe '#get_bulk_runs' do
    it 'returns an array of bulk_runs' do
      VCR.use_cassette('get_bulk_runs') do
        bulk_runs = BrowseAi.client.get_bulk_runs(robot_id:)
        expect(bulk_runs).to be_a(Array)
        expect(bulk_runs.first).to be_a(BulkRun)
      end
    end
  end

  # GET robots/{robotId}/bulk_runs/{id}
  describe '#get_bulk_run' do
    it 'returns an bulk_run' do
      id = VCR.use_cassette('get_bulk_runs') do
        bulk_runs = BrowseAi.client.get_bulk_runs(robot_id:)
        bulk_runs.first['id']
      end

      VCR.use_cassette('get_bulk_run') do
        expect(BrowseAi.client.get_bulk_run(robot_id:, id:)).to be_a(BulkRun)
      end
    end
  end
end
