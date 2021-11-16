class UsersController < ApplicationController

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
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated book successfully."
    else
      render edit_user_path(@user.id)
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
