class BooksController < ApplicationController

  def index
    @book = Book.new
    @post_images = PostImage.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @book = Book.new
    @show_book = Book.find(params[:id])
    @user = @show_book.user

  end

  def edit
    @book = Book.find(params[:id])
    
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
