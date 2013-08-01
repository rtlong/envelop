require "envelop/version"


module Envelop
  autoload :Configuration, 'envelop/configuration'
  autoload :Configurator, 'envelop/configurator'

  def self.configure(env=ENV, &block)
    Configuration.new env, &block
  end
end
