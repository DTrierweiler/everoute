require 'spec_helper'

describe Everoute do

  before :each do
    @routeplaner = Everoute.new
  end

  describe "#new" do
    it "should return a Everoute object" do
      @routeplaner.should be_an_instance_of Everoute
    end
  end

end