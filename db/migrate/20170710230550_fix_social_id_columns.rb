class FixSocialIdColumns < ActiveRecord::Migration[5.0]
  def change
    change_column :foursquare_checkins, :checkinid, :string
    change_column :twitter_statuses, :statusid, :string
  end
end
