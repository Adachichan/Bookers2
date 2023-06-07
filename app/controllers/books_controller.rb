class BooksController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @user = current_user
    @post_book = Book.new
    @books = Book.all
  end

  def create
    @post_book = Book.new(book_params)
    @post_book.user_id = current_user.id
    save_result = @post_book.save
    if save_result
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@post_book.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @post_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def update
    @book = Book.find(params[:id])
    update_result = @book.update(book_params)
    if update_result
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    post_book = Book.find(params[:id])
    post_book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end

end
