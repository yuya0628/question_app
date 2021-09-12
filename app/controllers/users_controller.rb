class UsersController < ApplicationController

  skip_before_action :login_required,only:[:new,:create]

  def new
    @user=User.new
  end

  def create
    user=User.new(user_params)
    user.save
    redirect_to questions_path
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def index
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
    @questions=@user.questions.all
  end

  def destroy
    user=User.find(params[:id])
    user.destroy
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:image)
  end
end
