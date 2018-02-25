class CommentsController < ApplicationController
  def create
    book = Book.find_by(id: params[:book_id])
    @comment = book.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to book_path(book)
    else
      @book = Book.find_by(id: params[:book_id])
      render template: "books/show"
    end
  end

  def edit
    @book = Book.find_by(id: params[:book_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @book = Book.find_by(id: params[:book_id])
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find_by(id: params[:book_id])
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to book_path(book)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
