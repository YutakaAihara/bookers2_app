class UsersController < ApplicationController
  before_action :baria_user, only: [:edit, :update]

  def index
    @user = current_user
    @users = User.page(params[:page]).reverse_order
    @book = Book.new
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully"
      redirect_to user_path(@user.id)
    else
      render action: :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :profile, :image)
  end

  def baria_user
    unless User.find(params[:id]).id == current_user.id
        redirect_to user_path(current_user)
    end
  end

end
