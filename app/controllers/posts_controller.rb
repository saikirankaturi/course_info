class PostsController < ApplicationController
	def index
		@posts=Post.all
	end
	def varnew
		@post = Post.new
	#~ @post = Post.new(params[:post]) 
	
	end
	def create
		@post = Post.new(params[:post]) 
		@post.save
	end
	def show
	    #~ @post=Post.find(params[:id])
	end
	def update
		@post=Post.find(params[:id])
		@post.update_attributes(params[:content])
		@post.save
		redirect_to root_url
	end
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to :back, :notice=>"Comment has been deleted successfully"
	end
end

