class BooksController < ApplicationController
  before_action :baria_book, only: [:edit, :update]

  def index
    @user = current_user
    @book = Book.new
    @books = Book.page(params[:page]).reverse_order
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.page(params[:page]).reverse_order
      @user = current_user
      render :index
    end
  end

  def show
    @book = Book.new
    @show_book = Book.find(params[:id])
    @user = @show_book.user
    @books = @user.books.page(params[:page]).reverse_order


  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render action: :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def baria_book
    unless Book.find(params[:id]).user_id == current_user.id
      redirect_to books_path
    end
  end



end
