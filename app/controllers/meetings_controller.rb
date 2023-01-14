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

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    @meeting.update(meeting_params)
    @meeting.save
    redirect_to root_path
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to root_path
  end

  private

  def meeting_params
    params.require(:meeting).permit(:start_time, :end_time, :name)
  end
end
