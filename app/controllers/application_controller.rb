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

      get '/items' do # List all items
        items = Item.all
        items.to_json
      end

      get '/items/:id' do # List specified item
        items = Item.find(params[:id])
        items.to_json
      end

      post '/trips' do # Create a trip
        trip = Trip.create(
          name: params[:name]
        ) # Add named parameters for text fields
        trip.to_json
      end

      post '/items' do # Create an item
        item = Item.create(
          name: params[:name],
          trip_id: params[:trip_id]
        ) # Add named parameters for text fields
        item.to_json
      end

      patch '/trips/:id' do # Update specific trip's info
        trips = Trip.find(params[:id])
        trips.update(name: params[:name])
        trips.to_json
      end
      
      delete '/trips/:id' do # Deletes the corresponding trip
        trip = Trip.find(params[:id])
        trip.destroy
        trip.to_json
      end
      
      delete '/items/:id' do # Deletes the corresponding trip
        item = Item.find(params[:id])
        item.destroy
        item.to_json
      end
     end
     
     
     

      
     
     