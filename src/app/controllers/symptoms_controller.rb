class symptoms_controller < ApplicationController
  before_action :authenticate_user!
  before_action :current_user
  def articles
  end


  def symptoms
    
    @user_id = current_user.id
    render json: { user_id: user_id }
  end



end
