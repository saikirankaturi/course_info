class ArticlesController < ApplicationController
  before_filter :authorize, only: [:edit, :update]
  
  def index
    @articles = Article.all
    #~ 0 => Aerospace Engineering  
    #~ 1 => Applied Statistics and Informatics  
    #~ 2 => Biosciences & Bioengineering 
    #~ 3 => Chemical Engineering  
    #~ 4 => Chemistry  
    #~ 5 => Civil Engineering  
    #~ 6 => Computer Science and Engineering 
    #~ 7 => Earth Sciences
    #~ 8 => Electrical Engineering  
    #~ 9 => Energy Science and Engineering  
    #~ 10 => Engineering Physics  
    #~ 11 => Humanities and Social Sciences
    #~ 12 => Mathematics
    #~ 13 => Mechanical Engineering
    #~ 14 => Metallurgical Engineering and Materials Science  
    #~ 15 => Physics  
    #~ 16 => Centre for Entrepreneurship
    #~ 17 => Centre for Environmental Science & Engineering  
    #~ 18 => Centre for Research in Nano Technology and Sciences  
    #~ 19 => Centre for Technology Alternatives for Rural Areas  
    #~ 20 => Centre for Urban Science and Engineering  
    #~ 21 => Centre of Studies in Resources Engineering  
    #~ 22 => Animation  
    #~ 23 => Industrial Design Centre  
    #~ 24 => Interaction Design  
    #~ 25 => Mobility and Vehicle Design  
    #~ 26 => Visual Communication  
    #~ 27 => Climate Studies  
    #~ 28 => Educational Technology  
    #~ 29 => Industrial Engineering and Operations Research  
    #~ 30 => Systems and Control Engineering  
    #~ 31 => Shailesh J. Mehta School of Management  
    #~ 32 => Other 
    
    @dept_count=33
    @article_dept=Array.new(@dept_count){Array.new}
    @articles.each do |article|
		if article.course_code[0..1]=="AE"
			@article_dept[0].push(article)
		elsif article.course_code[0..1]=="SI"
			@article_dept[1].push(article)
		elsif article.course_code[0..1]=="BB" || article.course_code[0..1]=="BM" || article.course_code[0..1]=="BM" || article.course_code[0..1]=="BT"
			@article_dept[2].push(article)
		elsif article.course_code[0..1]=="CL"
			@article_dept[3].push(article)
		elsif article.course_code[0..1]=="CH"
			@article_dept[4].push(article)
		elsif article.course_code[0..1]=="CE"
			@article_dept[5].push(article)
		elsif article.course_code[0..1]=="CS"
			@article_dept[6].push(article)
		elsif article.course_code[0..1]=="GS"
			@article_dept[7].push(article)
		elsif article.course_code[0..1]=="EE"
			@article_dept[8].push(article)
		elsif article.course_code[0..1]=="EN"
			@article_dept[9].push(article)
		elsif article.course_code[0..1]=="EP"
			@article_dept[10].push(article)
		elsif article.course_code[0..1]=="HS"
			@article_dept[11].push(article)
		elsif article.course_code[0..1]=="MA"
			@article_dept[12].push(article)
		elsif article.course_code[0..1]=="ME"
			@article_dept[13].push(article)
		elsif article.course_code[0..1]=="MM"
			@article_dept[14].push(article)
		elsif article.course_code[0..1]=="PH"
			@article_dept[15].push(article)
		elsif article.course_code[0..1]==""    ##### No course code found for this.
			@article_dept[16].push(article)
		elsif article.course_code[0..1]=="ES"
			@article_dept[17].push(article)
		elsif article.course_code[0..1]=="NT"
			@article_dept[18].push(article)
		elsif article.course_code[0..1]=="TD"
			@article_dept[19].push(article)
		elsif article.course_code[0..1]==""   ##### No course code found for this.
			@article_dept[20].push(article)
		elsif article.course_code[0..1]=="NR" || article.course_code[0..2]=="GNR"
			@article_dept[21].push(article)
		elsif article.course_code[0..1]=="AN"
			@article_dept[22].push(article)
		elsif article.course_code[0..1]=="ID"
			@article_dept[23].push(article)
		elsif article.course_code[0..1]=="IN"
			@article_dept[24].push(article)
		elsif article.course_code[0..1]=="MD"
			@article_dept[25].push(article)
		elsif article.course_code[0..1]=="VC"
			@article_dept[26].push(article)
		elsif article.course_code[0..1]=="CM"
			@article_dept[27].push(article)
		elsif article.course_code[0..1]=="ET"
			@article_dept[28].push(article)
		elsif article.course_code[0..1]=="IE"
			@article_dept[29].push(article)
		elsif article.course_code[0..1]=="SC"
			@article_dept[30].push(article)
		elsif article.course_code[0..1]=="MG" || article.course_code[0..1]=="MN"
			@article_dept[31].push(article)
		else
			@article_dept[32].push(article)
		end
    end
    @users = User.all
  end

  def show
    @article = Article.find(params[:id])
    @user = User.find_by_email(@article.ind)	#ind will be equal to profe
    @posts = Post.all
    @post = Post.new
    @index_var=0;
  end
  
  def new
	@article = Article.new
  end
	
  def create
  	#@article = Article.new(params[:article])
	@article = Article.new(params[:article])  # VVVVIMP  =>  This params will get that post info that was sent by new html on submitting.
	#this returns a bool if it succeeds
	#~ @article.ind=current_user.email
	if @article.save
		redirect_to root_url, :notice=> "Course is added successfully"
	else 
		render "new"
	end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to @article, notice: "Course info's modified content has been updated."
    else
      render "edit"
    end
  end
  
  def destroy
		@article = Article.find(params[:id])
		posts=Post.all
		posts.each do |post|
			if post.ind == @article.id.to_s then
				post.destroy
			end
		end
		@article.destroy
		redirect_to root_url, :notice => "Course successfully deleted!"
  end
  
  def new_comment
    @article = Article.find(params[:id])
    if @article
		@post=Post.new
		#~ @post = Post.new(params[:post])
		#~ @post.ind=params[:id]
		#~ @post.prof_student=current_user.prof_student
		#~ @post.name=current_user.name
		#~ @post.email=current_user.email 
		#~ @post.save
			#~ redirect_to root_url
	else
		redirect_to show_article_path(article)
	end
  end
  
  def save
    @article = Article.find(params[:id])
	@post = Post.new(params[:post])
	@post.ind=params[:id]
	@post.prof_student=current_user.prof_student
	@post.name=current_user.name
	@post.email=current_user.email 
	@post.save
	redirect_to :action => "show", :id => params[:id]
  end
  
  #~ private
	#~ 
	#~ def post_params
	#~ params.require(:post).permit(:title, :content)
	#~ end
end
