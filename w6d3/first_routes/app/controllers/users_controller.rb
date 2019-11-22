class UsersController < ApplicationController
  def index
    if params[:id] && User.find_by(id: params[:id])
      user = User.find(params[:id])
      redirect_to user_url(user)
    elsif params[:id] && !User.find_by(id: params[:id])
      render json: ["User does not exist"], status: :unprocessable_entity
    else
      user = User.all
      render json: user
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end

  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
  
    if user.update(user_params)
      redirect_to user_url(user)
    else
      render json: user.errors.full_messages, status: 422
    end

  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end

  private
    def user_params
      params.require(:user).permit(:user_name)
    end
end