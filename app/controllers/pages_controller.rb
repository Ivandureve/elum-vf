class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :home ]

  def home

  end

  def contact
  end

  def about
  end

  def dashboard
    require 'json'
    require 'open-uri'
    require 'net/http'

    @user = current_user
    @usine = Usine.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@usine) do |usine, marker|
      marker.lat usine.latitude
      marker.lng usine.longitude
    end

    time = Time.now
    datetime = time.to_formatted_s(:iso8601)
    @usine.each do |u|
      url = 'http://api.openweathermap.org/data/2.5/weather?q=' + u.city + ',' + u.country + '&appid=<%=6cfa110201b58f2e3f882aa175cb4032'
      uri = URI(url)
      response = Net::HTTP.get(uri)
    jan = JSON.parse(response)
    @pressure = jan["main"]
    end





    # url = 'http://api.openweathermap.org/data/2.5/weather?q=' + @usine.city + ',' + @usine.country + '&appid=<%=' + @api_key
    # sun = open(url).read
    # @jan = JSON.parse(sun)
# location = @usine.latitude + @usine.longitude
# url = 'api.openweathermap.org/data/2.5/weather?q={@usine.city},{@usine.country}'
# user_serialized = open(url).read
# user = JSON.parse(user_serialized)






  end
end


