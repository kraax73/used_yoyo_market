class ApplicationController < ActionController::Base
  
  #必ず最初にログイン中のユーザーを取得する
  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  #アクセス制限の処理を共通化する
  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です。"
      redirect_to("/login")
    end
  end

  #ログイン済ユーザーのアクセス禁止を適用
  def forbid_login_user
    if @current_user 
      flash[:notice] = "すでにログインしています。"
      redirect_to("/yoyos/index")
    end
  end
  
end
