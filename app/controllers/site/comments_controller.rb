class Site::CommentsController < ApplicationController
	before_action :authenticate_member!
	
	def create
		@comment = Comment.create(comment_params)
		@comment.member = current_member

		if @comment.save
			redirect_to site_ad_detail_path(@comment.ad_id), notice: "Comentário adicionado com sucesso!"
		else
			redirect_to site_ad_detail_path(@comment.ad_id)
		end
	end

	private 

	def comment_params
		params.require(:comment).permit(:body, :ad_id)
	end
end
