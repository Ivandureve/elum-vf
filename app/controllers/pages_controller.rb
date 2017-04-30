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
    url = 'https://developer.nrel.gov/api/solar/data_query/v1.json?api_key=qW19o6ybJUVBmyBLYBURyrUiTIx0QvddrHHxkPAu&lat=40&lon=-105&radius=50&all=1'
    sun = open(url).read
    @jan = JSON.parse(sun)
    @version = @jan["version"]
    @user = current_user
    @usine = Usine.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@usine) do |usine, marker|
      marker.lat usine.latitude
      marker.lng usine.longitude
    end


  end
end


