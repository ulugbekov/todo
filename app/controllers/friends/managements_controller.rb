class Friends::ManagementsController < ApplicationController
  before_filter :find_user, :only=>[:update, :destroy, :show ]
  before_filter :authenticate_user!
  def index
    @users=User.where(["id != ?", current_user.id])
  end
  def show
    @friends=@user.friends
  end
  
  def edit
    
    
  end
  
  def update
    @friend=User.find(params[:id])
    unless @user.friends.include?(@friend)
    @user.friends << @friend
    end
    redirect_to friends_managements_path
  end
  
  def destroy
    @friend=User.find(params[:id])
    @user.friends.delete(@friend) if @user.friends.include?(@friend)
    redirect_to friends_management_path(@user)
  end
  
  private
  def find_user
    @user=current_user
  end
end
