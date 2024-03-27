class ArticlesController < ApplicationController

 #authenticating and keeping user dashbpards seperate on sign in
  before_action :authenticate_user!, only: [:users]

  before_action :authenticate_admin!, only: [:admin]
  before_action :authenticate_healthcare!, only: [:healthcare]

  def symptoms
  end


  def about
  end


  def index
  end


  def users
  end

  def healthcare
  end

  def admin
  end
end
