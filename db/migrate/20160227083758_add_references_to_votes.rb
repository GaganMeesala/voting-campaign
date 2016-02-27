class AddReferencesToVotes < ActiveRecord::Migration
  def change
    add_reference :votes, :campaign, index: true
  end
end
