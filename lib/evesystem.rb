class Evesystem

  attr_accessor :jump, :region, :solarsystem, :sec, :holder

  def initialize(attrs)
    @jump = attrs[0]
    @region = attrs[1]
    @solarsystem = attrs[2]
    @sec = attrs[3]
    @holder = attrs[4]
  end

end

