class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id]) 
    Like.create(user_id: current_user.id, post_id: params[:post_id])
    render "posts/likes/create.js.erb"
  end

  def destroy
    @post = Post.find(params[:post_id])
    Like.find_by(user_id: current_user.id, id: params[:id]).destroy
    render "posts/likes/destroy.js.erb"
  end

  def show
    render partial: "posts/like", locals: { post: post}
  end

  
end

