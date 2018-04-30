class GossipsController < ApplicationController

  def new
    @gossip = Gossip.new
    
  end

  def create
    @gossip = Gossip.new(gossip_params)
    if @gossip.save
        redirect_to gossip_path(@gossip.id)
    else
        render 'new'
    end
  end

  def show
    @gossip = Gossip.find(params[:id])
  end
  
  def edit
    @gossip = Gossip.find(params[:id])
  end
  
  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(gossip_params)
    redirect_to gossip_path
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  def index
    @gossips = Gossip.all
  end
  

  private
  def gossip_params
    params.permit(:anonymous_author, :content)
  end
  
end
