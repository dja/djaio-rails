class CreateFoursquareCheckins < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'uuid-ossp'
    create_table :foursquare_checkins, id: :uuid do |t|
      t.uuid :checkinid, null: false, index: { unique: true }
      t.datetime :timestamp, null: false
      t.json :data, null: false
      t.timestamps
    end
  end
end
