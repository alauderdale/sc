module CheckInsHelper
	def total_score
    @check_in = CheckIn.find(params[:id])
    @check_in.nose_rating + @check_in.taste_rating + @check_in.finish_rating + @check_in.rating
  end
end
