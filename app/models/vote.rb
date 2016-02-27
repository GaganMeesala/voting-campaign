class Vote < ActiveRecord::Base
  belongs_to :campaign

  def self.get_leaders(winning_votes)
    leaders = []
    winning_votes.each do |vote|
      leaders << vote.choice
    end
    leaders.uniq
  end
end
