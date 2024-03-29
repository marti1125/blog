class PostsController < ApplicationController
  
  def new
  end

  def index
  	@posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
  	# render :text => params[:post].inspect
  	@post = Post.new(params[:post])

  	if @post.save
  	   redirect_to :action => :show, :id => @post.id
    else
      render 'new' #return template new
    end
  end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to :action => :show, :id => @post.id
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to :action => :index
  end
 
end
