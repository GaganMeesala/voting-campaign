class VotesController < ApplicationController

  def index
    @campaign = Campaign.find_by(:id => params[:campaign_id])
    @votes = Vote.all
    if @campaign
      @winning_votes = @votes.where(:campaign_id => @campaign.id, :validity => "during")
      @losing_votes = @votes.where(:campaign_id => @campaign.id, :validity => ["pre", "post"])
      leaders = Vote.get_leaders(@winning_votes)
      @leader_details = []
      leaders.each do |leader|
        leader = @winning_votes.where(choice: leader)
        @leader_details << leader
      end
    end
  end
end
