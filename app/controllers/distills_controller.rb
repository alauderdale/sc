class DistillsController < ApplicationController
	  before_filter :authenticate_user!
  def index
    @distills = Distill.order('name asc')
  end

  def show
    @distill = Distill.find(params[:id])
  end


	def new
    if current_user.admin
      @distill = Distill.new
    else
      redirect_to root_path, :notice => "Woa Woa Woa...I don't think so"
    end
  end

  def create
    @distill = Distill.new(distill_params)
    if @distill.save
    #If save succeeds return to list action
      redirect_to distills_path, :notice => "Distill added"
    #if form fails, redisplay form so user can fix problems
    else
      flash[:alert]= "Oops something went wrong!"
      render :action => :new
    end
  end

  def distill_params
    params.require(:distill).permit(:name, :description, :distill_image)
  end

  def edit
    @distill = Distill.find(params[:id])
  end


  def update_distill
    # Find object using form parameters
    @distill = Distill.find(params[:id])
    # Update the object
    if @distill.update_attributes(distill_params)
      # If update succeeds, redirect to the list action
      redirect_to distill_url, :notice => "Distill Updated"
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def destroy
    distill = Distill.find(params[:id])
    distill.destroy
    redirect_to distills_path, :notice => "Distill Deleted"
  end
end
