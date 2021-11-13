class UsersController < ApplicationController

  def show
    @user=User.find(params[:id])
  end

  def index
    @user=current_user
    @book=Book.new
  end

  def edit
    @user=current_user
    @user=User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_imag, :user_id)
  end

end