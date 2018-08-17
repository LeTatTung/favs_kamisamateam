class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :load_data, only: [:show]
  
  def index
     
    # @q = User.ransack(name_cont: params[:q])
    # @farmers = @q.result(distinct: true)
    @farmers = User.ransack(name_cont: params[:q]).result(distinct: true)
    @posts = Post.ransack(title_cont: params[:q]).result(distinct: true)
  end

  def show
    if valid_page?
      render template: "pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist? Pathname
      .new(Rails.root + "app/views/pages/#{params[:page]}.html.erb")
  end

  def load_data
    @posts = Post.all
  end
end
