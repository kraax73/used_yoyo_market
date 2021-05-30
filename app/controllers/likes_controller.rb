class LikesController < ApplicationController
  before_action :authenticate_user #ログインユーザーのみの制限
  
  def create
    @like = Like.new(
      user_id: @current_user.id,
      yoyo_id: params[:yoyo_id]
    )
    @like.save
    flash[:notice] = "いいね!しました。"
    redirect_to("/yoyos/#{params[:yoyo_id]}")
  end

  def destroy
    @like = Like.find_by(
      user_id: @current_user.id,
      yoyo_id: params[:yoyo_id]
    )
    @like.destroy
    flash[:notice] = "いいね!を取り消しました。"
    redirect_to("/yoyos/#{params[:yoyo_id]}")
  end
  
end