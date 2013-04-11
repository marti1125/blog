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

end
