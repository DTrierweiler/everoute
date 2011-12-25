require 'open-uri'
require 'nokogiri'
require 'mechanize'

class Everoute

  BASE_URL = 'http://evemaps.dotlan.net/route/'

  def initialize
    @agent = Mechanize.new
  end


  def travel(system_arr)
    sys_string = system_arr[0]
    system_arr.each 1 do |system|
      sys_string << ":" + system
    end
    page = @agent.get BASE_URL+sys_string

    puts page
  end

end