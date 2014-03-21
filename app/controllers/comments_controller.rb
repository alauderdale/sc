class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
  @liquor = Liquor.find(params[:liquor_id])
    @comment = @liquor.comments.build(comment_params)
    @comment.liquor_id = @liquor.id
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@liquor, :notice => 'Comment was successfully created.') }
        format.xml  { render :xml => @liquor, :status => :created, :location => @liquor }
      else
        format.html { redirect_to(@liquor, :notice => 
        'Comment could not be saved. Please fill in all fields')}
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    @liquor = @comment.liquor
    respond_to do |format|
      if @comment.update_attributes(comment_params)
        format.html { redirect_to(@liquor, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @liquor = Liquor.find(params[:liquor_id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(@liquor, :notice => 'Comment was successfully deleted.') }
      format.xml  { head :ok }
    end
  end

   def comment_params
    params.require(:comment).permit(:body, :comment_id, :user_id)
  end
end