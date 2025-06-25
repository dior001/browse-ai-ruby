require 'browse_ai'

module BrowseAi
  module DSL
  end
end

require 'browse_ai/dsl/robots'
require 'browse_ai/utils'
require 'mime-types'

module BrowseAi
  module DSL
    include Robots
    include Utils
  end
end
