class symptoms_controller < ApplicationController
  before_action :authenticate_user!
  before_action :current_user
  def index
  end
end
