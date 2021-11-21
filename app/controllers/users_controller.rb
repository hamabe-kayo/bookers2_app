class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user=User.find(params[:id])
    @book=Book.new
    @books=@user.books
  end

  def index
    @user=current_user
    @users=User.all
    @book=Book.new
    @books=Book.all
  end

  def edit
    @user=User.find(params[:id])
    unless @book.user == current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user=User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    else
      if @user.update(user_params)
        redirect_to user_path(@user.id), notice: "You have updated user successfully."
      else
        render :edit
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
