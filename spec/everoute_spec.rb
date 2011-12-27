require 'spec_helper'

describe Everoute do

  before :each do
    @routeplaner = Everoute.new
    @sys_arr = ['Jita', 'Dodixie']
  end

  describe "#new" do
    it "should return a Everoute object" do
      @routeplaner.should be_an_instance_of Everoute
    end
  end

  describe "#travel" do
    it "should return an array" do
      @routeplaner.travel(@sys_arr).should be_an_instance_of Array
    end

    it "should return an array containing evesystem objects" do
      routes = @routeplaner.travel(@sys_arr)
      routes.each do |jump|
        jump.should be_an_instance_of Evesystem
      end
    end

    it "should contain 13 jumps" do
      @routeplaner.travel(@sys_arr).size == 13
    end

    it "should jump over Tama as 5th jump" do
      routes = @routeplaner.travel(@sys_arr)
      routes[4].solarsystem == "Tama"
    end
  end


end