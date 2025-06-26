require 'delegate'
require 'json'
require 'time'

module BrowseAi
  module Resources
    class Object < SimpleDelegator
      require 'browse_ai/resources/object/serializers'
      require 'browse_ai/resources/object/attributes'

      include Serializers
      include Attributes

      # Define common attributes, applicable to different resources
      attribute :date_created_utc, Time
      attribute :date_updated_utc, Time

      def inspect
        "#<#{self.class.name}:#{format('0x00%x', object_id << 1)} #{inspect_attributes}>"
      end

      private

      def inspect_attributes
        attributes.map { |key, value| "@#{key}=#{value.inspect}" }.join(' ')
      end
    end
  end
end
