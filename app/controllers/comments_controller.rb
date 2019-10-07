class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:name, :body))

    redirect_to post_path(@post)
  end

  # delete comments
  def destroy 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy 
    
    #same as when we create a comment..when we delete a comment we want the user to stay on that post show page
    redirect_to post_path(@post)
  end
end
