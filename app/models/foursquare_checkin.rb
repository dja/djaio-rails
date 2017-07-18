class FoursquareCheckin < ApplicationRecord

  scope :is_public, -> { where("(data -> 'visibility') is null") }
end
