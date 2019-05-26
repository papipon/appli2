class UsersController < ApplicationController
before_action :authenticate_user!
  def show
  	@user = User.find(params[:id])
   	@books = @user.books
  	@book = Book.new
  end
  
  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  	
  end

  def create
  end

  def edit
  	@user = User.find(params[:id])

     if current_user.id != @user.id
       redirect_to user_path(current_user)
    end
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(@user.id)

    else
       render "edit"
    end  
  end



 private
  def correct_user
  end

  def user_params
	   params.require(:user).permit(:name,:introduction,:profile_image)
  end



end
