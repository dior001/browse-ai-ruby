require 'browse_ai/dsl'

module BrowseAi
  module DSL::Tasks
    # GET /Tasks
    # Get tasks.
    # @param [String] robot_id The ID of the robot the tasks belong to.
    # @return [Array, nil].
    def get_tasks(robot_id:)
      raise ArgumentError, 'Robot ID cannot be blank' if robot_id.blank?

      Resources::Task.parse(request(:get, "robots/#{robot_id}/tasks/", nil), %w[tasks items])
    end

    # GET /Task/{id}
    # Get a task.
    # @param [String] id A task's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [BrowseAi::Resources::Task, nil].
    def get_task(robot_id:, id:)
      raise ArgumentError, 'Robot ID cannot be blank' if robot_id.blank?
      raise ArgumentError, 'ID cannot be blank' if id.blank?

      Resources::Task.parse(request(:get, "robots/#{robot_id}/tasks/#{id}"), ['task'])
    end
  end
end
