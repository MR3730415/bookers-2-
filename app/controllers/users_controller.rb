class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
    @books = Book.where(user_id:@user.id)
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id:@user.id)
  end
  
  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render "edit"
    else
      redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:notice] = "successfully"
    else
    render :edit
    end
  end
  
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
