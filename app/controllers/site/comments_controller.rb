class Site::CommentsController < ApplicationController
	before_action :authenticate_member!

	def create
		@comment = Comment.create(comment_params)
		@comment.member = current_member

		if @comment.save
			redirect_to
		end
	end

	private 

	def comment_params
		params.require(:comment).permit(:bod, :ad_id)
	end
end
