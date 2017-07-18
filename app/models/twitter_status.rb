class TwitterStatus < ApplicationRecord
  scope :is_public, -> { where("(data ->> 'in_reply_to_screen_name') is null or (data ->> 'in_reply_to_screen_name') = ?", 'dja1o') }
end
