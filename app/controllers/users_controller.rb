class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: @user.id)

  end

  def edit
  # if params[:id] == current_user.id
  #   @book = Book.new
    @user = User.find(params[:id])
  #   render action: :edit
  # else
  #   @user = current_user
  #   render action: :show
  # end  
  
    unless current_user.id == @user.id
      redirect_to user_path(current_user.id)
    end
    
  end
  

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
