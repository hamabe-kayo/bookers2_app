class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @newbook=Book.new
    @user=current_user
    @books=Book.all
  end

  def create
    @newbook=Book.new(book_params)
    @newbook.user_id=current_user.id
    if @newbook.save
      redirect_to book_path(@newbook), notice: "You have created book successfully."
    else
      @user=current_user
      @books=Book.all
      render :index
    end
  end

  def show
    @book=Book.find(params[:id])
    @newbook=Book.new
    @user=@book.user
  end

  def edit
    @book=Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end

  def update
    @book=Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to book_path
    else
      if @book.update(book_params)
        redirect_to book_path(@book), notice: "You have updated book successfully."
      else
        render :edit
      end
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
