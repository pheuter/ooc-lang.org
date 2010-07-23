class AlpacaController < ApplicationController
  require 'open-uri'
  layout false
  
  def index
    @linux = (Hpricot(open('http://server.markfayngersh.com:4567'))/"ul[@class='posts']").search("li")[1].inner_html.squeeze(" ").strip.gsub(/\n/,'')
  end

end
