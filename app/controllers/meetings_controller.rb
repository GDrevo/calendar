class MeetingsController < ApplicationController
  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user = current_user
    @meeting.save
    redirect_to root_path
  end

  private

  def meeting_params
    params.require(:meeting).permit(:start_time, :end_time)
  end
end
