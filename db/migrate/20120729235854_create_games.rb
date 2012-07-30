class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :type
      t.string :league
      t.string :status
      t.string :display_status
      t.string :url
      t.integer :home_score
      t.integer :visitor_score
      t.string :channel
      t.string :reason
      t.datetime :game_time
      t.integer :home_team_id
      t.integer :visitor_team_id

      t.timestamps
    end
  end
end
