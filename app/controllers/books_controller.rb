class BooksController < ApplicationController

  def index
    @newbook=Book.new
    @user=current_user
    @books=Book.all
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      render book_path
    end
  end

  def show
    @newbook=Book.new
    @user=current_user
    @book=Book.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    book=Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path(book.id), notice: "You have updated book successfully."
    else
      render edit_book_path(@book.id)
    end
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
