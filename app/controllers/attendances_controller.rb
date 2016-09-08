class AttendancesController < ApplicationController

  def create
  # make sure the user hasnt already attended to event

   if session[:userinfo]["id"] != nil
    @attendance = Attendance.find_by({user_id: session[:userinfo]["id"], afterevent: params[:afterevent]})

      if @attendance == nil then
          @attendance = Attendance.new
          @attendance.afterevent_id = params[:afterevent_id]
          # @attendance.user_id = current_user.id
          @attendance.user_id = session[:userinfo]["id"]
          @attendance.save
          binding.pry
      end
    end
    # @afterevent = Afterevent.find_by(name: "Dinner @ Crown");

    @attendance_count = Attendance.where(afterevent_id: params[:afterevent_id]).count;

    render json:{attendance_count: @attendance_count}
  end
end
