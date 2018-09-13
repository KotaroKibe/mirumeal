class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :recruiter_id
      t.timestamps
    end
    add_index :relationships, :user_id
    add_index :relationships, :recruiter_id
    add_index :relationships, [:user_id, :recruiter_id], unique: true
  end
end

