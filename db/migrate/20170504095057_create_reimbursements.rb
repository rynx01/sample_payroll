class CreateReimbursements < ActiveRecord::Migration[5.0]
  def change
    create_table :reimbursements do |t|
      t.string :category
      t.string :description
      t.decimal :amount
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :reimbursements, [:user_id, :created_at]
  end
end
