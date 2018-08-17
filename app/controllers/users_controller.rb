class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @farmers = User.load_farmers.paginate(page: params[:page],
      per_page: Settings.page_farmer_size).order(id: :desc)
  end
 
  def show
    @user = User.find(params[:id])
  end
end
