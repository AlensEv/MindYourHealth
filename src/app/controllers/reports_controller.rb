class ReportsController < ApplicationController
  # getting userid from symptoms
  def symptoms
    @user_id = current_user.id
    render json: { user_id: user_id }
  end
  #Making sure reports can save from articles
  def articles
    @Reports = Report.all
  end



  def create
    session_token = params[:session_token]
    selected_symptoms = params[:symptoms]

 # Saving the report to the database
    report = Report.new(session_token: session_token, symptoms: selected_symptoms)
    #Error checking the status if reports do actually save
    if report.save
      render json: { status: 'success', report_id: report.id }
    else
      render json: { status: 'error', errors: report.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
