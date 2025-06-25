require 'browse_ai/dsl'

module BrowseAi
  module DSL::Robots
    # GET /Robots
    # Get robots.
    # @return [Array, nil].
    def get_robots
      Resources::Robot.parse(request(:get, 'robots/', nil), ['robots', 'items'])
    end

    # GET /Robot/{id}
    # Get a robot.
    # @param [String] id A robot's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [BrowseAi::Resources::Robot, nil].
    def get_robot(id:)
      raise ArgumentError, 'ID cannot be blank' if id.blank?

      Resources::Robot.parse(request(:get, "robots/#{id}"), ['robot'])
    end
  end
end
