class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :choice
      t.string :validity

      t.timestamps
    end
  end
end
