require 'spec_helper'

describe Evesystem do

  before :each do
    @attributes = [1, "The Forge", "Jita", "0.9", "Caldari State"]
    @system = Evesystem.new @attributes
  end

  describe "#new" do
    it "should return a Evesystem object" do
      @system.should be_an_instance_of Evesystem
    end
  end

  it "should have valid attributes" do
    @system.jump == 1
    @system.region == "The Forge"
    @system.solarsystem == "Jita"
    @system.sec == "0.9"
    @system.holder == "Caldari State"
  end

end