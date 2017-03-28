class PostsController < ApplicationController

  def index
    @posts = Post.all
    @authors = User.all
    return render layout: "three_col"
  end

  def create
    Post.create( protect_params )
    return redirect_to '/posts'
  end

  private
    def protect_params
      params.require(:post).permit(:title, :content, :user_id)
    end

end
