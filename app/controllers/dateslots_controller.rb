class DateslotsController < ApplicationController
  require 'will_paginate/array'

  def index
    @dateslots = Dateslot.all.sort_by{|d| d.first_event}
    #@dateslots = @dateslots.first(2)
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
    @events = Dateslot.all.each.inject({}) do |memo, dateslot|
      dates = dateslot.converted_schedule.first(10)

      dates.each do |date|
        if memo.has_key?(date)
          memo[date] << dateslot
        else
          memo[date] = [dateslot]
        end
      end

      memo
    end.sort_by{ |date| date }
    @events = @events.paginate(page: params[:page], per_page: 30)
  end

  def events
    @dateslots = Dateslot.all.sort_by{|d| d.first_event}
  end

  def destroy
    @dateslot = Dateslot.find(params[:id])
    @dateslot.destroy
    flash[:notice] = "Dateslot verwijderd"
    redirect_to(dateslots_path)
  end

end