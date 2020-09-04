require 'gemat_processor'
require 'gcalc'

describe GematProcessor do

  before(:each) do
    @line = 'שלום'
    processor = GematProcessor.new
    @lineFields = processor.process(@line).split(',')
  end

  it 'should leave original phrase in the line' do
    @lineFields[0].should == @line
  end

  it 'should set little gematric value as second field' do
    @lineFields[1].should == GCalc.littleMethod(@line).to_s
  end

  it 'should set big gematric value as second field' do
    @lineFields[2].should == GCalc.bigMethod(@line).to_s
  end

end