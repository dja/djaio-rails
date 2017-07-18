class FoursquareCheckinsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "foursquare_checkins"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
