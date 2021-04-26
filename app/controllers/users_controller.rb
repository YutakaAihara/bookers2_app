class UsersController < ApplicationController

  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile, :image)
  end

end
