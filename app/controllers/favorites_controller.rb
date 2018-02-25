class FavoritesController < ApplicationController
  def create
    book = Book.find_by(id: params[:book_id])
    @favorite = Favorite.new
    @favorite.book_id = book.id
    @favorite.user_id = current_user.id

    @favorite.save
  end

  def destroy
    book = Book.find_by(id: params[:book_id])
    @favorite = Favorite.find_by(book_id: book.id, user_id: current_user.id)
    @favorite.destroy
  end
end
