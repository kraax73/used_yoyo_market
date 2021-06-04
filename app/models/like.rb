class Like < ApplicationRecord 

  #user_idとyoyo_idのそれぞれに、値が存在していることをチェック
  
  validates :user_id,{presence: true}

  validates :yoyo_id,{presence: true}

end
