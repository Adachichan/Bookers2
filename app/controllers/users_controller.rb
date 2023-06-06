class UsersController < ApplicationController

  def index
    @user = current_user
    @post_book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post_book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    update_result = @user.update(user_params)
    if update_result
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
