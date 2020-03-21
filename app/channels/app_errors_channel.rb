class AppErrorsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "app_errors_channel"
    stream_for current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
