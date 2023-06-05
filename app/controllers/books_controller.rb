class BooksController < ApplicationController

  def index
    @user = current_user
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
    @book = Book.find(params[:id])
  end

  def show
    @user = current_user
    @post_book = Book.new
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    post_book = Book.find(params[:id])
    post_book.destroy
    redirect_to book_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
