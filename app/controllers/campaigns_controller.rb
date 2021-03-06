class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
    if @campaign
      @valid_votes = Vote.valid_votes(@campaign.id)
      @invalid_votes = Vote.invalid_votes(@campaign.id)
      total_leaders = Vote.get_leaders(@valid_votes)
      @leaders = []
      total_leaders.each { |leader| @leaders << @valid_votes.where(choice: leader) }
    end
  end
end
