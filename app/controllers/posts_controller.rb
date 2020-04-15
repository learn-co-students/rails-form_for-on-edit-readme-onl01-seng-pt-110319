class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new
	  @post.title = params[:title]
	  @post.description = params[:description]
	  @post.save
	  redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
	  @post = Post.find(params[:id]) #find my post 
	  @post.update(params.require(:post).permit(:title, :description)) #update my post into the params, require allows us to nest hash into post hash
	  redirect_to post_path(@post) #redirect to show page 
	end
end