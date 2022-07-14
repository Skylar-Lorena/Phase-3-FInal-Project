class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'
    
    get '/trips' do # List all trips
      trips = Trip.all
      trips.to_json
    end
   