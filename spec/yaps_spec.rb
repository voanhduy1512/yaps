require 'spec_helper'

describe Yaps do
  describe '#with_pushlisher_enable' do
    it 'should enable Yaps for block in its scope' do
      Yaps.configuration.enable = false
      Yaps.with_pushlisher_enable do
        expect(Yaps.configuration.enable).to eq(true)
      end
    end

    it 'should not change configuration state outside of its scope' do
      Yaps.configuration.enable = false
      Yaps.with_pushlisher_enable do
      end
      expect(Yaps.configuration.enable).to eq(false)
    end

    it ' should execute the block pass to it' do
      a = 5
      Yaps.with_pushlisher_enable do
        a = 10
      end
      expect(a).to eq(10)
    end
  end
end
