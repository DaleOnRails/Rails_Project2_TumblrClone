class PostsController < ApplicationController

  #in this application i have created authentication for the blog posts. That way only users who are logged into the application have the ability to edit, delete posts. Anyone who is not signed in can only see the index and post show page.
  #this comes from the devise instructions. it forces the user to redirect to the login page if the user was not logged in.
  before_action :authenticate_user!, except: [:index, :show]

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

  # edit is responsible for the view file same as new
  # to edit a post must first find the post by id same with update method
  def edit
    @post = Post.find(params[:id])
  end

  # create and UPDATE interacts with the database to ensure post is created or updated.
  def update
    @post = Post.find(params[:id])

    # permits two parts of a post to be updated: title and body
    if @post.update(params[:post].permit(:title, :body))
      redirect_to @post
    else
      #if update fails then render edit again (so they have another chance to edit the post)
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  #4.
  #private methods are to apply to the methods above them. only in this file.
  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
