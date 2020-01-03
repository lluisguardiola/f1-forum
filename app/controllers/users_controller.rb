class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    load_user
  end

  def new
    @errors = flash[:errors]
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.valid?
      user.save
      redirect_to user_path(user)
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path(user)
    end
  end

  def edit
    load_user
  end

  def update
    load_user

    if @user.valid?
      @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    load_user
    @user.destroy
    redirect_to users_path
  end

  private

  def load_user
    @user = User.all.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end
