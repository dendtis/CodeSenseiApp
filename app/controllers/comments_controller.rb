class CommentsController < ApplicationController
  def create
  	@article = Article.find(params[article_id])
  	@comment = article.comments.new(comment_params)
  	if @comment.save
      flash[:notice] = 'Your comment was saved'
  	  redirect_to article_path(@article) 
    end

  private

  def comment_params
  	params.require(:comment).permit(:commenter, :body)
  end

end
