class TripsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :load_trips, :except => [ :new, :index, :create ]

  def index
    @trips = Trip.order(:name)
  end

  def show
  end

  def new
    @hotels = Hotel.order(:name)
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(params[:trip])
    if @trip.save
      flash[:notice] = "Trip was created successfully."
      respond_with(@trip) do |format|
        format.html { redirect_to @trip }
      end 
    else
      flash[:error] = @trip.errors.full_messages.join(", ")
      @hotels = Hotel.order(:name)
      render :action => :new
    end
  end

  protected

  def load_trips
    @trip = Trip.find(params[:id])
  end
end
