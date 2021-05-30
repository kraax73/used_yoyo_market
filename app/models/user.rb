class User < ApplicationRecord

#空欄を防ぐためにpresenceバリデーションを設定

validates :name, {presence: true}

validates :email, {presence: true, uniqueness: true} #uniquenessは重複防止

validates :password, {presence: true}

def yoyos
  return Yoyo.where(user_id: self.id)
end

end
