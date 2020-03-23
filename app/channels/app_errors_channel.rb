class AppErrorsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "app_errors_channel"
    stream_for App.find_by(params[:name])
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
