class GossipsController < ApplicationController

  def new
    
  end

  def create
    @gossip = Gossip.new(anonymous_author: params[:anonymous_author], content: params[:content])
    if @gossip.save
        redirect_to gossip_path(@gossip.id)
    else
        render 'new'
    end
  end

  def show
    
  end
  
  
end
