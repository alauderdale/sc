class CheckInsController < ApplicationController
	before_filter :authenticate_user!

	def create
	  @liquor = Liquor.find_by_id(params[:liquor_id])
	  @check_in = CheckIn.new(check_in_params)
	  @check_in.liquor_id = @liquor.id
	  @check_in.user_id = current_user.id
	  if @check_in.save
	      respond_to do |format|
	          format.html { redirect_to liquor_path(@liquor), :notice => "Drink Up, you have checked-in with #{@liquor.name}!" }
	          format.js
	      end
	  end
	end

  def update
      @liquor = Liquor.find_by_id(params[:liquor_id])

      @check_in = current_user.check_ins.find_by_liquor_id(@liquor.id)
      if @check_in.update_attributes(check_in_params)
          respond_to do |format|
              format.html { redirect_to liquor_path(@liquor), :notice => "Your rating has been updated" }
              format.js
          end
      end
  end

  def destroy
    @check_in = CheckIn.find(params[:id])
    @check_in.destroy
    redirect_to root_path , :notice => "Check In Deleted"
  end

  def check_in_params
    params.fetch(:check_in, {}).permit(:body, :rating, :user_id, :liquor_id)
  end

  def show
    @check_in = CheckIn.find(params[:id])
    @comments = @check_in.comment_threads.order('created_at asc')
    @new_comment = Comment.build_from(@check_in, current_user, "")
  end
end
