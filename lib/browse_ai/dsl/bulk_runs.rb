require 'browse_ai/dsl'

module BrowseAi
  module DSL::BulkRuns
    # POST /robots/{robotId}/bulk-runs
    # Executes a bulk run on a robot.
    # @param [String] robot_id The ID of the robot the bulk_runs belongs to.
    # @param [String] :payload The JSON payload to send to the robot.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [BrowseAi::Resources::BulkRun, nil].
    def bulk_run_tasks(robot_id:, payload:)
      raise ArgumentError, 'Robot ID cannot be blank' if robot_id.blank?
      raise ArgumentError, 'Payload cannot be blank' if payload.blank?

      Resources::BulkRun.parse(request(:post, "robots/#{robot_id}/bulk_runs/", payload), %w[result bulkRun])
    end

    # GET robots/{robotId}/bulk-runs
    # Get bulk_runs.
    # @param [String] robot_id The ID of the robot the bulk runs belongs to.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Array, nil].
    def get_bulk_runs(robot_id:)
      raise ArgumentError, 'Robot ID cannot be blank' if robot_id.blank?

      Resources::BulkRun.parse(request(:get, "robots/#{robot_id}/bulk-runs/", nil), %w[result items])
    end

    # GET robots/{robotId}/bulk-runs/{id}
    # Get a bulk_run.
    # @param [String] id A bulk run's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [BrowseAi::Resources::BulkRun, nil].
    def get_bulk_run(robot_id:, id:)
      raise ArgumentError, 'Robot ID cannot be blank' if robot_id.blank?
      raise ArgumentError, 'ID cannot be blank' if id.blank?

      Resources::BulkRun.parse(request(:get, "robots/#{robot_id}/bulk-runs/#{id}"), %w[result bulkRun])
    end
  end
end
