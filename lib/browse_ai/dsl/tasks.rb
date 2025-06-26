require 'browse_ai/dsl'

module BrowseAi
  module DSL::Tasks
    # POST /robots/{robotId}/tasks
    # Runs a task on a robot.
    # @param [String] robot_id The ID of the robot the tasks belongs to.
    # @param [String] :payload The JSON payload to send to the robot.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [BrowseAi::Resources::Task, nil].
    def run_robot(robot_id:, payload:)
      raise ArgumentError, 'Robot ID cannot be blank' if robot_id.blank?
      raise ArgumentError, 'Payload cannot be blank' if payload.blank?

      Resources::Task.parse(request(:post, "robots/#{robot_id}/tasks/", payload), ['result'])
    end

    # GET robots/{robotId}/tasks
    # Get tasks.
    # @param [String] robot_id The ID of the robot the tasks belongs to.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Array, nil].
    def get_tasks(robot_id:)
      raise ArgumentError, 'Robot ID cannot be blank' if robot_id.blank?

      Resources::Task.parse(request(:get, "robots/#{robot_id}/tasks/", nil), %w[tasks items])
    end

    # GET robots/{robotId}/tasks/{id}
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
