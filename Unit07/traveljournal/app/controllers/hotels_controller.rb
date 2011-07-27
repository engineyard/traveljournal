class HotelsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :load_hotel, :except => [:new, :index, :create]

  def index
    respond_with(@hotels = Hotel.order(:name))
  end

  def show
  end

  def new
    @cities = City.order(:name)
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(params[:hotel])
    if @hotel.save
      flash[:notice] = "Hotel was created successfully."
      respond_with(@hotel) do |format|
        format.html { redirect_to @hotel }
      end
    else
      flash[:error] = @hotel.errors.full_messages.join("\n")
      @cities = City.order(:name)
      render :action => :new
    end
  end

  def edit
    @cities = City.order(:name)
  end

  def update
    if @hotel.update_attributes(params[:hotel])
      flash[:notice] = "Hotel was updated successfully."
      respond_with(@hotel) do |format|
        format.html { redirect_to @hotel }
      end
    else
      flash[:error] = @hotel.errors.full_messages.join("\n")
      @cities = City.order(:name)
      render :action => "edit"
    end
  end

  def destroy
    @hotel.destroy
    respond_with(@hotel) do |format|
      format.html { redirect_to(hotels_url) }
    end
  end

  protected

  def load_hotel
    @hotel = Hotel.find(params[:id])
  end
end
