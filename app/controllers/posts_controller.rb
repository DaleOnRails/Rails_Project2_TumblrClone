class PostsController < ApplicationController

  #1. Show all posts
  def index
    #6.show in descending order
    @post = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    #3.
    #this is how the post will be saved
    #include params(says to save the title and body)
    #params will be defined in the private method at bottom so they can be re-used and code will be DRY
    if @post.save
      redirect_to @post
    else #(if post fails to save)
      #render the post again.
      #uses render instead of redirecct_to so that there is NO http refresh so the user wont lose the post content
      render "new"
    end
  end

  #5.
  #show only 1 post
  def show
    #find post by id and show
    @post = Post.find(params[:id])
  end

  #4.
  #private methods are to apply to the methods above them. only in this file.
  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
