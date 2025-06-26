require 'spec_helper'

describe BrowseAi::DSL::Tasks do
  def robot_id
    VCR.use_cassette('get_robots') do
      robots = BrowseAi.client.get_robots
      robots.first['id']
    end
  end

  # POST /robots/{robotId}/tasks
  describe '#run_robot' do
    let(:payload) do
      {
        'inputParameters' => {
          'originUrl' => 'Test',
        }
      }.to_json
    end

    it 'creates a task and runs it' do
      VCR.use_cassette('run_robot') do
        task = BrowseAi.client.run_robot(robot_id:, payload:)
        expect(task).to be_a(Task)
      end
    end
  end

  # GET robots/{robotId}/tasks
  describe '#get_tasks' do
    it 'returns an array of tasks' do
      VCR.use_cassette('get_tasks') do
        tasks = BrowseAi.client.get_tasks(robot_id:)
        expect(tasks).to be_a(Array)
        expect(tasks.first).to be_a(Task)
      end
    end
  end

  # GET robots/{robotId}/tasks/{id}
  describe '#get_task' do
    it 'returns an task' do
      id = VCR.use_cassette('get_tasks') do
        tasks = BrowseAi.client.get_tasks(robot_id:)
        tasks.first['id']
      end

      VCR.use_cassette('get_task') do
        expect(BrowseAi.client.get_task(robot_id:, id:)).to be_a(Task)
      end
    end
  end
end
