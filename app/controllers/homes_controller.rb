class HomesController < ApplicationController
  def index

  end

  def facebook_data
    @graph = Koala::Facebook::API.new
    @profile = @graph.get_object("me")
    require "uri"
    require "net/http"
    
    url = URI("https://graph.facebook.com/v18.0/3725650561095985/posts?access_token=#{@graph.access_token}")
    
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    
    response = https.request(request)
    @messages =  JSON.parse(response.body)["data"]
  end

end
