class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end
  
  def edit
	@user = User.find(params[:id])
  end
  
  def update
	@user = User.find(params[:id])
    if @user.update_attributes(:course=>params[:user][:course])
		@var = Article.find_by_course_code(@user.course)
		@var.ind = @user.email
		@var.save
		redirect_to root_url, notice: "Course info has been updated."
    else
      render "edit"
    end
  end
end
