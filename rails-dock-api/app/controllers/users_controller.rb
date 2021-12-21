class UsersController < ApplicationController
  before_action :authorize!
  before_action :can_see_all_users!, only: [:admin]

  def admin
    render json: { message:
       "This is the users admin response - it is authenticated using jwt + Auth0. " \
       "We aren't going to show all users to any authenticated users however."
      }
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
