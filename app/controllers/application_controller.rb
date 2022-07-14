class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'
    
    get '/trips' do # List all trips
      trips = Trip.all
      trips.to_json
    end
    
    get '/trips/:id' do # List the specified trip and its items
        trips = Trip.find(params[:id])
        trips.to_json(include: :items)
      end
     