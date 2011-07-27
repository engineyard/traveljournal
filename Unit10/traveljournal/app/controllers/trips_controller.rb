class TripsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :load_trip, :except => [:new, :index, :create]

  def index
    respond_with(@trips = Trip.order(:name))
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
      flash[:error] = @trip.errors.full_messages.join("\n")
      @hotels = Hotel.order(:name)
      render :action => :new
    end
  end

  def edit
    @hotels = Hotel.order(:name)
  end

  def update
    if @trip.update_attributes(params[:trip])
      flash[:notice] = "Trip was updated successfully."
      respond_with(@trip) do |format|
        format.html { redirect_to @trip }
      end
    else
      flash[:error] = @trip.errors.full_messages.join("\n")
      @cities = City.order(:name)
      render :action => "edit"
    end
  end

  def destroy
    @trip.destroy
    respond_with(@trip) do |format|
      format.html { redirect_to(trips_url) }
    end
  end

  protected

  def load_trip
    @trip = Trip.find(params[:id])
  end
end
