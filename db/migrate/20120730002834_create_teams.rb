class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :shortname
      t.string :nickname
      t.string :division
      t.string :league

      t.timestamps
    end
  end
end
