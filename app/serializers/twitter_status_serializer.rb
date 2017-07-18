class TwitterStatusSerializer < ActiveModel::Serializer
  attributes :id, :timestamp, :data
end
