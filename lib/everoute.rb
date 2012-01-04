require 'open-uri'
require 'nokogiri'
require 'mechanize'
require 'evesystem'

class Everoute

  BASE_URL = 'http://evemaps.dotlan.net/route/'
  TRADEHUBS = %w(Jita Rens Hek Amarr Dodixie)

  attr_accessor :route

  def initialize
    @agent = Mechanize.new
  end

  def travel(system_arr, hisec=0)
    sys_string = ""
    sys_string << "2:" if hisec == "1"
    sys_string << system_arr[0]
    system_arr.each_with_index do |sys, i|
      next if i == 0
      sys_string << ":" + sys
    end
    page = @agent.get BASE_URL+sys_string
    arr = page.parser.xpath('//html/body/div/div/div[2]/div[2]/div/div/table/tr')
    route = []
    arr.each_with_index do |a, i|
      next if i == 0
      scan = [i]
      scan.concat a.to_s.scan(/<tr.*?>\n<td.*?<\/td>\n.*?<td>(.*?)<\/td>\n.*?<a.*?<a.*?>(.*?)<\/a>.*?<span.*?>(.*?)<\/span>.*?<i>(.*?)<\/i>.*?<td.*?>/m)[0]
      scan[1] = scan[1].scan(/.*?<a.*?<a.*?>(.*?)<\/a>.*?/m)[0][0] if scan[1].scan(/.*?<a.*?<a.*?>(.*?)<\/a>.*?/m)[0]
      route << Evesystem.new(scan)
    end
    route
  end

  # The # of jumps has to be reduced by 1, cause the first system isn't really a jump
  def find_tradehubs(start_sys, hisec)
    output = ""
    TRADEHUBS.each do |hub|      
      temp_arr = [start_sys, hub]
      route = travel(temp_arr, hisec)
      output << "#{hub}: #{route.size-1}  "
    end
    output
  end

end