class ReportsController < ApplicationController
  def symptoms
    @user_id = current_user.id
    render json: { user_id: user_id }
  end


  def create
    session_token = params[:session_token]
    selected_symptoms = params[:symptoms]

 # Saving the report to the database
    report = Report.new(session_token: session_token, symptoms: selected_symptoms)
    if report.save
      render json: { status: 'success', report_id: report.id }
    else
      render json: { status: 'error', errors: report.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
