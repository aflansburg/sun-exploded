class UsersController < ApplicationController
  before_action :authorize!

  def index
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user_id).permit(:first_name, :last_name, :email, :mobile_phone)
  end
end
