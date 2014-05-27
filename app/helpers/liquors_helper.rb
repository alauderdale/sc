module LiquorsHelper

	def check_in_ballot
        current_user.check_ins.new
    end

	def current_user_check_in
    if @check_in = current_user.check_ins.find_by_liquor_id(params[:id])
        @check_in.rating
    else
        "N/A"
    end
	end
        
end
