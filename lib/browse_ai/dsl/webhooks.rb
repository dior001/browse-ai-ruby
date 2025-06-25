require 'browse_ai/dsl'

module BrowseAi
  module DSL::Webhooks
    # GET /Webhooks
    # Get webhooks.
    # @param [String] robot_id The ID of the robot the webhooks belong to.
    # @return [Array, nil].
    def get_webhooks(robot_id:)
      raise ArgumentError, 'Robot ID cannot be blank' if robot_id.blank?

      Resources::Webhook.parse(request(:get, "robots/#{robot_id}/webhooks/", nil), ['webhooks', 'items'])
    end
  end
end
