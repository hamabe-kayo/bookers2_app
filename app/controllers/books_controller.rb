class BooksController < ApplicationController

  def index
    @book=Book.new
    @user=current_user
  end

  def create
    book=Book.new(book_params)
    book.user_id=current_user.id
    book.save
    redirect_to book_path(book.user_id)
  end

  def show
    @user=current_user
    @book=Book.find
  end

  private
  def book_params
    params.permit(:title, :body, :user_id)
  end
end
