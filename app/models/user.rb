class User < ApplicationRecord

#空欄を防ぐためにpresenceバリデーションを設定

validates :name, {presence: true}

validates :email, {presence: true, uniqueness: true} #uniquenessは重複防止

validates :password, {presence: true}


#Userモデル内にユーザーに紐付いたYoyoインスタンスを戻り値として返すyoyosメソッドを定義
def yoyos
  return Yoyo.where(user_id: self.id)
end

end
