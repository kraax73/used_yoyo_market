class YoyosController < ApplicationController

  #全アクション共通処理
  before_action :authenticate_user, {only: [:index, :sell, :edit, :update, :destroy]} #ログインユーザーのみアクセス可
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]} #ログインユーザー自身の情報のみ編集可

  def index
    @yoyos = Yoyo.all.order(created_at: :desc) #上から新しい順に
  end

  def search
    #検索フォームで取得したパラメータをモデルに渡す
    @yoyos = Yoyo.search(params[:search])
  end

  def show
    @yoyo = Yoyo.find_by(id: params[:id])
    @user = @yoyo.user  #yoyoインスタンスを@userに代入
  end

  def sell
    @yoyo = Yoyo.new
  end

  def create
      @yoyo = Yoyo.new(
      name: params[:name],
      detail: params[:detail],
      price: params[:price],
      #出品時にuser_idに出品したユーザーidを加える
      user_id: @current_user.id
    )

    if params[:image]
      @yoyo.image_name = "#{@yoyo.name}.jpg"
      image = params[:image]
      File.binwrite("public/yoyo_images/#{@yoyo.image_name}",image.read)
    end

    if @yoyo.save
      flash[:notice] = "出品しました。"
      redirect_to("/yoyos/#{@yoyo.id}")
    else
      render("yoyos/sell")
    end

  end

  def edit
    @yoyo = Yoyo.find_by(id: params[:id])
  end

  def update
    @yoyo = Yoyo.find_by(id: params[:id])
    @yoyo.name = params[:name]
    @yoyo.detail = params[:detail]
    @yoyo.price = params[:price]
    
    if params[:image]
      @yoyo.image_name = "#{@yoyo.id}.jpg"
      image = params[:image]
      File.binwrite("public/yoyo_images/#{@yoyo.image_name}",image.read)
    end
    
    if @yoyo.save
      flash[:notice] = "商品を編集しました"
      redirect_to("/yoyos/#{@yoyo.id}")
    else
      render("yoyos/edit")
    end

  end

  def destroy
    @yoyo = Yoyo.find_by(id: params[:id])
    
    if @yoyo.destroy
     flash[:notice] = "商品を削除しました。"
     redirect_to("/yoyos/index")
    end

  end

  def ensure_correct_user
    @yoyo = Yoyo.find_by(id: params[:id])
    if @yoyo.user_id != @current_user.id
      flash[:notice] = "権限がありません。"
      redirect_to("/yoyos/index")
    end
  end

end
