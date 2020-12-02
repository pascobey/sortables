class CreateSortables < ActiveRecord::Migration[6.0]
  def change
    create_table :sortables do |t|
      t.integer :position

      t.timestamps
    end
  end
end
