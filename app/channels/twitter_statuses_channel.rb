class TwitterStatusesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "twitter_statuses"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
