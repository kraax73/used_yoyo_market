class UsersController < ApplicationController
  before_action :forbid_login_user,{only: [:new, :create, :login_form, :login]} #ログインユーザーのみアクセス可
  before_action :ensure_correct_user, {only: [:edit, :update]} #ログインユーザー自身の情報のみ編集可

  def show
    @user = User.find_by(id: params[:id]) 
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )  
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "アカウント登録が完了しました。"
      redirect_to("/users/#{@user.id}") 
    else
      render("/users/new")
    end

  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    
    if @user.save 
      flash[:notice]="アカウント情報を編集しました。"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end

  end

  def login_form
  end

  def login
    @user = User.find_by(
      email: params[:email],
      password: params[:password]
    )

    #特定したユーザーidをsessionに代入することでログイン状態を保持
    if @user 
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/users/#{@user.id}") 
    else
      @error_message = "メールアドレスまたはパスワードが間違っています。"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end

  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました。"
    redirect_to("/login")
  end

  #to_iでparamsを文字列から数値に変換して比較
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません。"
      redirect_to("/yoyos/index")
    end
  end

  def likes
    @user = User.find_by(id:params[:id])
    @likes = Like.where(user_id: @user.id)
  end

end
