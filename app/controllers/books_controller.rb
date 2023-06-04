class BooksController < ApplicationController

  def index
    @post_book = Book.new
    @books = Book.all
  end

  def create
    @post_book = Book.new(book_params)
    @post_book.user_id = current_user.id
    @post_book.save
    redirect_to book_path(@post_book.id)
  end

  def edit

  end

  def show
    @post_book = Book.new
    @book = Book.find(params[:id])
  end

  def destroy
    post_book = Book.find(params[:id])
    post_book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end

end
