require 'test_helper'

describe Etrstm35fin do
  it 'version must be defined' do
    Etrstm35fin::VERSION.wont_be_nil
  end

  it 'should do conversion' do
    Etrstm35fin.to_wgs84(6711804, 240724).must_equal [60.458829651406916, 22.28345319220464]
  end

end
