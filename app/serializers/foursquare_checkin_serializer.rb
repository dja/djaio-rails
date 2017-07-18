class FoursquareCheckinSerializer < ActiveModel::Serializer
  attributes :id, :timestamp, :data
end
