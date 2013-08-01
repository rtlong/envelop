require 'envelop'

module Envelop
  class Configurator
    def initialize(config)
      @config = config
    end

    def flag(name)
      @config.define_singleton_method(:"#{name}?") do
        keys = @env.keys.grep(/#{name}/i)
        @env.values_at(*keys).compact.length > 0
      end
    end

  end
end

