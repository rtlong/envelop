require 'helper'
require 'envelop'

describe Envelop do

  describe '.configure' do
    it { Envelop.must_respond_to(:configure) }
    it 'returns a Configuration object' do
      Envelop.configure.must_be_instance_of(Envelop::Configuration)
    end
  end

end
