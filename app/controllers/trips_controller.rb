class TripsController < ApplicationController
  before_filter :load_trips, :except => [ :new, :index, :create ]

  def index
    @trips = Trip.order(:name)
  end

  def show
  end

  protected

  def load_trips
    @trip = Trip.find(params[:id])
  end
end
