class Book < ApplicationRecord
	belongs_to :user
	has_many :comments, :dependent => :destroy
	has_many :favorites, :dependent => :destroy
	validates :title, presence: true
	validates :body ,presence: true, length: {maximum: 200}

	def unique_favo user
    favorites.where(user_id: user.id).exists?
  end

end
