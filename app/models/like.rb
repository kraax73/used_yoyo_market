class Like < ApplicationRecord 

  validates :user_id,{presence: true}

  validates :yoyo_id,{presence: true}

end
