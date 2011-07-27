class TripsController < ApplicationController
  before_filter :load_trip, :except => [:new, :index, :create]

  def index
    @trips = Trip.order(:name)
  end

  def show
  end

  protected

  def load_trip
    @trip = Trip.find(params[:id])
  end
end
