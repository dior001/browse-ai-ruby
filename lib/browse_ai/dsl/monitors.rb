require 'browse_ai/dsl'

module BrowseAi
  module DSL::Monitors
    # GET /Monitors
    # Get monitors.
    # @param [String] robot_id The ID of the robot the monitors belong to.
    # @return [Array, nil].
    def get_monitors(robot_id:)
      raise ArgumentError, 'Robot ID cannot be blank' if robot_id.blank?

      Resources::Monitor.parse(request(:get, "robots/#{robot_id}/monitors/", nil), ['monitors', 'items'])
    end

    # GET /Monitor/{id}
    # Get a monitor.
    # @param [String] id A monitor's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [BrowseAi::Resources::Monitor, nil].
    def get_monitor(robot_id:, id:)
      raise ArgumentError, 'Robot ID cannot be blank' if robot_id.blank?
      raise ArgumentError, 'ID cannot be blank' if id.blank?

      Resources::Monitor.parse(request(:get, "robots/#{robot_id}/monitors/#{id}"), ['monitor'])
    end
  end
end
