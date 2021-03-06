class LiquorsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @liquors = Liquor.order('name asc')
  end

  def show
    @liquor = Liquor.find(params[:id])
    @current_user_check_ins = @liquor.check_ins.where(user_id:current_user.id).order('created_at desc')
  end


	def new
    if current_user.admin
      @liquor = Liquor.new
    else
      redirect_to root_path, :notice => "Woa Woa Woa...I don't think so"
    end
  end

  def create
    @liquor = Liquor.new(liquor_params)
    @liquor.user_id = current_user.id
    if @liquor.save
    #If save succeeds return to list action
      redirect_to liquors_path, :notice => "Liquor added"
    #if form fails, redisplay form so user can fix problems
    else
      flash[:alert]= "Oops something went wrong!"
      render :action => :new
    end
  end

  def liquor_params
    params.require(:liquor).permit(:name, :description, :user_id, :liquor_image, :age, :distill_id)
  end

  def edit
    @liquor = Liquor.find(params[:id])
  end


  def update_liquor
    # Find object using form parameters
    @liquor = Liquor.find(params[:id])
    # Update the object
    if @liquor.update_attributes(liquor_params)
      # If update succeeds, redirect to the list action
      redirect_to liquors_url, :notice => "Liquor Updated"
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def destroy
    liquor = Liquor.find(params[:id])
    liquor.destroy
    redirect_to liquors_path, :notice => "Liquor Deleted"
  end





end
