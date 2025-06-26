require 'browse_ai'

module BrowseAi
  module DSL
  end
end

require 'browse_ai/dsl/bulk_runs'
require 'browse_ai/dsl/monitors'
require 'browse_ai/dsl/robots'
require 'browse_ai/dsl/tasks'
require 'browse_ai/dsl/webhooks'
require 'browse_ai/utils'
require 'mime-types'

module BrowseAi
  module DSL
    include BulkRuns
    include Monitors
    include Robots
    include Tasks
    include Utils
    include Webhooks
  end
end
