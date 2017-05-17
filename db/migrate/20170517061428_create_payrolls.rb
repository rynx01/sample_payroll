class CreatePayrolls < ActiveRecord::Migration[5.0]
  def change
    create_table :payrolls do |t|
      t.string :period
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :payrolls, [:user_id, :created_at]
  end
end
