class ApplicationController < ActionController::Base
  include Pundit::Authorization

  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = '此頁面不存在'
      redirect_to root_path
    end
  end
end
