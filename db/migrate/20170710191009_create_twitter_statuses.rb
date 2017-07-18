class CreateTwitterStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :twitter_statuses, id: :uuid do |t|
      t.uuid :statusid, null: false
      t.datetime :timestamp, null: false
      t.json :data, null: false
      t.timestamps
    end
  end
end
