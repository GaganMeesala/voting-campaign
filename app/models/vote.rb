class Vote < ActiveRecord::Base
  belongs_to :campaign

  scope :valid_votes, ->(campaign_id) { where(campaign_id: campaign_id, validity: "during") }
  scope :invalid_votes, ->(campaign_id) { where(campaign_id: campaign_id, validity: ["pre", "post"]) }

  def self.get_leaders(valid_votes)
    leaders = []
    valid_votes.each { |vote| leaders << vote.choice }
    leaders.uniq
  end
end