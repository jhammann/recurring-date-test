class DateslotsController < ApplicationController

  def index
    @dateslots = Dateslot.all
  end

  def show
    @dateslot = Dateslot.find(params[:id])
  end

  def new
    @dateslot = Dateslot.new
  end

  def create
    @dateslot = Dateslot.new(params[:dateslot])
    if @dateslot.save
      flash[:notice] = 'Dateslot saved'
      redirect_to(dateslots_path)
    else
      render :action => :new
    end
  end

  def overview
    @dateslots = Dateslot.all
  end

end
