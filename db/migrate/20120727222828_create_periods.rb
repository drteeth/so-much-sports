class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.boolean :is_default
      t.string :label

      t.timestamps
    end
  end
end
