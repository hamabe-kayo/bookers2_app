class BooksController < ApplicationController

  def index
    @book=Book.new
    @user=current_user
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    @book.save
    redirect_to book_path(@book.user_id)
  end

  def show
    @user=current_user
    @book=Book.find(params[:id])
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to :index
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
