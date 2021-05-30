class Yoyo < ApplicationRecord

  #空欄を防ぐためにpresenceバリデーションを設定
  
  validates :name,{presence: true} 

  validates :user_id,{presence: true}

  validates :image_name,{presence: true}

  validates :detail,{presence: true}

  validates :price,{presence: true}

  def user
    return User.find_by(id: self.user_id)
  end

  def self.search(search)
    empty_search = true

    if search         #検索した場合、検索ワードを含む商品を表示
      Yoyo.where(['name LIKE ?', "%#{search}%"])
    else
      Yoyo.none       #検索してない場合、空データをセット
    end
  end

end
