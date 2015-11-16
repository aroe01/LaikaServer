class EventsController < ApplicationController
	skip_before_filter  :verify_authenticity_token  
   def create
  	puts "Creating"
  	#puts events_params
  	#puts Rack::Utils.parse_nested_query(params)
  	#puts JSON.parse(params[:event])
  	
  	@event = Event.new
  	@event.lat = params[:latitude]
  	@event.long = params[:longitude]
    @event.heat = 0
    @event.photo_urls = "[]"
  	if @event.save
  		render json: @event  	
   	else
  		render "FAILED"
  	end
  end
  def destroy
    puts "Deleting"
    params.require(:id)
    Event.find(params[:id]).destroy    
    render Event.all
    #render 'show'
    #need template here
  end
   def show
  	puts "Showing"
	@events = Event.all
    @response = {"events" => @events}
    render json: @response
  end
  def upphoto
    puts "UpPhoto"
    #puts params
    params.require(:id) 
    puts params[:id]
    uploaded_io = params[:image]

    @photoPath = Rails.root.join('public', 'uploads', uploaded_io.original_filename)
    puts @photoPath

    @event = Event.find(params[:id])
    @jsonPhotos = JSON.parse( @event.photo_urls)    
    @jsonPhotos.push(@photoPath)
    puts JSON.generate(@jsonPhotos)
    @event.photo_urls = JSON.generate(@jsonPhotos)
    #@event.save
    
    File.open(@photoPath, 'wb') do |file|
      file.write(uploaded_io.read)
    end
    render json: @response
  end
  private 
	def events_params
		#params.require(:event).permit(:latitude, :longitude)		
		params.require(:latitude)
		params.require(:longitude)
	end
end
