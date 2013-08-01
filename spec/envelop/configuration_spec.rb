require 'helper'
require 'envelop/configuration'

module Envelop

  describe Configuration do
    describe '#initialize' do
      let(:block) {}
      let(:args) { [] }
      subject { Configuration.new(*args, &block) }
      ENV['___Test_key'] = 'foobar'

      describe 'with no args' do
        it 'defaults to ::ENV' do
          subject['___Test_key'].must_equal ENV['___Test_key']
        end
      end

      describe 'with a hash' do
        let(:args) { [{'___Test_key' => 'barfoo'}] }
        it 'it uses that hash instead of ENV' do
          subject['___Test_key'].must_equal 'barfoo'
        end
      end

      describe 'with a block' do
        before { @called_with = nil }
        let(:block) { lambda { |c| @called_with = c } }
        it 'calls the block' do
          subject
          @called_with.wont_be_nil
        end
        it 'calls the block with an instance of the Configurator' do
          subject
          @called_with.must_be_instance_of Configurator
        end
      end
    end

    describe '#[]' do
      subject { Configuration.new('FOO' => 'bar') }
      it 'allows access to raw @env hash' do
        subject['FOO'].must_equal 'bar'
        subject['fOO'].must_be_nil
      end
    end
  end
end
