class MainController < ApplicationController

  def index
    # separate speeches and speakers? (maybe later..)
    @speeches = Speech.all
    @afterevent = Afterevent.all
    # @attendance = Attendance.all

    @afterevent1 = Afterevent.find_by(name: "Dinner @ Attica");
    @attendance1_count = Attendance.where(afterevent_id: @afterevent1.id).count;

    @afterevent2 = Afterevent.find_by(name: "Dinner @ Crown");
    @attendance2_count = Attendance.where(afterevent_id: @afterevent2.id).count;

    @afterevent3 = Afterevent.find_by(name: "Party @ Bond");
    @attendance3_count = Attendance.where(afterevent_id: @afterevent3.id).count;
    # binding.pry

    render :index
  end

  def map
    render :map
  end



end
