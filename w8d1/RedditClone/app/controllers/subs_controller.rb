class SubsController < ApplicationController
  before_action :require_logged_in
  def new
    @sub = Sub.new
    render :new
  end
  
  def create
   @sub = Sub.new(sub_params)
   @sub.user_id = current_user.id
  #  fail
    if @sub.save
      redirect_to sub_url(@sub)
    else
      render :new
    end
  end


  def show 
    @sub = Sub.find(params[:id]) 

  end 
  
  def index
    @subs = Sub.all
    render :index
  end
  

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    @sub.user_id = current_user.id
    if @sub.moderator.id == current_user.id &&  @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
