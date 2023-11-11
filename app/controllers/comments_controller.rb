class CommentsController < ApplicationController
  
  def create
    comments = Comment.all().pluck(:id).max + 1
    @comment = Comment.new
    @comment.author_id = params.fetch("query_author_id")
    @comment.venue_id = params.fetch("query_venue_id")
    @comment.body = params.fetch("query_body")
    
    if @comment.valid? and User.where({:id => @comment.author_id}).length > 0
      @comment.save
      redirect_to("/venues/#{@comment.venue_id}")
    else
      redirect_to("/venues/#{@comment.venue_id}")
    end

  end

end
