class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if params[:latest]
      @shoes = Shoe.where(user_id:params[:id]).latest
    elsif params[:old]
      @shoes = Shoe.where(user_id:params[:id]).old
    elsif params[:favorites]
      p "#############"
      @shoes = Shoe.where(user_id:params[:id]).favorites
      p @shoes
    else
      @shoes = Shoe.where(user_id:params[:id])
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user.id)
  end

  private
    def user_params
      params.requre(:user).permit(:nick_name, :gender, :foot_size, :foot_width)
    end

end
