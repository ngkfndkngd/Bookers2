class UsersController < ApplicationController
  before_action :authenticate_user!,except: [:top]
  def index
    @user = current_user
    @users = User.all
    @book_new = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books
    @book_new = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to books_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end
end
