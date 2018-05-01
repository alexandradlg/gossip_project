class CommentsController < ApplicationController

    def new    
        @comment = Comment.new
    end
    
    def create
        @gossip = Gossip.find(params[:gossip_id])
        @comment = Comment.new(comment_params)
        @comment.gossip = @gossip
        if @comment.save
            redirect_to gossip_path(@gossip.id)
        else
            render 'new'
        end
    end

    def edit
        @gossip = Gossip.find(params[:gossip_id])
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        @gossip = Gossip.find(params[:gossip_id])
        @comment.update(comment_params)
        redirect_to gossip_path(@comment.gossip_id)
    end

    def destroy
        @gossip = Gossip.find(params[:gossip_id])
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to gossip_path(@comment.gossip_id)
    end

    private
    def comment_params
      params.permit(:anonymous_commentor, :body)
    end
end

