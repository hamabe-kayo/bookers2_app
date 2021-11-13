class UsersController < ApplicationController

  def show
    @user=User.find(params[:id])
    @book
  end

  def index
    @user=current_user
    @book=Book.new
  end

  def edit
    @user=User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_imag)
  end

end
