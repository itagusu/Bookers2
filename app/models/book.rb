class Book < ApplicationRecord

  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  #has_many :liked_users, through: :favorites, source: :user

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  #def self.create_all_ranks #Noteクラスからデータを取ってくる処理なのでクラスメソッド！
    #Book.find(Favorite.group(:book_id).order('count(book_id) desc').limit(3).pluck(:book_id))
  #end

  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}

end
