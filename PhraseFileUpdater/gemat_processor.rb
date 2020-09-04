require 'gcalc'

class GematProcessor

  def process(line)
    line + ',' + GCalc.littleMethod(line).to_s + ',' + GCalc.bigMethod(line).to_s
  end

end