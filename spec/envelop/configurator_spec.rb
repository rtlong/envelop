require 'helper'
require 'envelop/configurator'

module Envelop

  describe Configurator do

    describe '#flag builds a predicate method' do
      let(:env) { {} }
      let(:config){ Configuration.new env }
      subject { Configurator.new config }

      it do
        subject.flag(:abc)
        config.must_respond_to :abc?
      end

      describe 'and when the variable is not set' do
        let(:env) { {'BBC' => 'Who'} }
        it 'returns true' do
          subject.flag(:abc)
          config.abc?.must_equal false
        end
      end

      describe 'and when the variable is set' do
        let(:env) { {'Abc' => 'foo'} }
        it 'returns true' do
          subject.flag(:abc)
          config.abc?.must_equal true
        end
      end
    end

  end
end
