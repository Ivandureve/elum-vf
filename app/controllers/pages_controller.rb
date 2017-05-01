class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    @usine = Usine.where.not(latitude: nil, longitude: nil)
  end

  def contact
  end

  def about
  end

  def dashboard
    require 'json'
    require 'uri'
    require 'open-uri'
    require 'byebug'

    @user = current_user
    @usine = Usine.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@usine) do |usine, marker|
      marker.lat usine.latitude
      marker.lng usine.longitude
    end
    time = Time.now
    datetime = time.to_formatted_s(:iso8601)

    URI.encode("Hello there world")
    @usine.each do |u|
      city = URI.encode(u.city)
      country = URI.encode(u.country)
      url = "http://api.openweathermap.org/data/2.5/weather?q=#{city},#{country}&appid=6cfa110201b58f2e3f882aa175cb4032"
      response = JSON.parse(open(url).read)
      pressure = response["main"]["pressure"]
      u.pressure = pressure
      u.save
    end


  end
end


