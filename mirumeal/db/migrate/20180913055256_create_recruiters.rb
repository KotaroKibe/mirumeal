class CreateRecruiters < ActiveRecord::Migration
  def change
    create_table :recruiters do |t|

      t.timestamps null: false
    end
  end
end
