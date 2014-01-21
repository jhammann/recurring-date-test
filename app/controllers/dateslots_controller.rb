class DateslotsController < ApplicationController
  require 'will_paginate/array'

  def index
    @dateslots = Dateslot.all.sort_by{|d| d.first_event}
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

  def edit
    @dateslot = Dateslot.find(params[:id])
  end

  def update
    @dateslot = Dateslot.find(params[:id])
    if @dateslot.update_attributes(params[:dateslot])
      flash[:notice] = 'Dateslot was successfully updated.'
      redirect_to(dateslots_path)
    else
      render :action => "edit"
    end
  end

  def overview
    @dateslots = Dateslot.all
    @events = @dateslots.map{|d| [d.converted_schedule.first(10)]}.flatten.sort
    @events = @events.paginate(page: params[:page], per_page: 40)
  end

end