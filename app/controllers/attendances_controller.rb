class AttendancesController < ApplicationController

  def create
  # make sure the user hasnt already attended to event

  # if logged_in?
    # @attendance = Attendance.find_by({user_id: current_user.id, afterevent: params[:afterevent]})

    if @attendance == nil then
        @attendance = Attendance.new
        @attendance.afterevent_id = params[:afterevent_id]
        # @attendance.user_id = current_user.id
        @attendance.user_id = User.first.id
        @attendance.save
    end
  # binding.pry
    # @afterevent = Afterevent.find_by(name: "Dinner @ Crown");
    @attendance_count = Attendance.where(afterevent_id: params[:afterevent_id]).count;

  # end
    # attendance_count = Afterevent.find(params[:afterevent_id]).attendances.count
    # @attendance1_count = Afterevent.where(name: "Dinner @ Attica").count;
    # @attendance2_count = Afterevent.where(name: "Dinner @ Crown").count;
    # @attendance3_count = Afterevent.where(name: "Party @ Bond").count;

    render json:{attendance_count: @attendance_count}
  end
end
