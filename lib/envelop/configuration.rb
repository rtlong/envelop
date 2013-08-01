require 'envelop'

module Envelop
  class Configuration
    def initialize(env=ENV, &block)
      @env = env
      block.call Configurator.new(self) if block
    end

    def [](key)
      @env[key]
    end
  end
end
