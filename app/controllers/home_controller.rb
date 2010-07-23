class HomeController < ApplicationController
  require 'open-uri'
  def index
    begin
      @linux = "<p style='color:green;'>"+(Hpricot(open('http://server.markfayngersh.com:4567'))/"ul[@class='posts']").search("li")[1].inner_html.squeeze(" ").strip.gsub(/\n/,'').match(/(.+)\(worked\)/)[1]+"</p>"
    rescue NoMethodError => e
      @linux = "<p style='color:red;'>"+(Hpricot(open('http://server.markfayngersh.com:4567'))/"ul[@class='posts']").search("li")[1].inner_html.squeeze(" ").strip.gsub(/\n/,'').match(/(.+)\(failed\)/)[1]+"</p>"
    end
  end
end
