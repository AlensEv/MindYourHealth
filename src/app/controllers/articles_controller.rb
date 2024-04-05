class ArticlesController < ApplicationController
  require 'base64'
  before_action :authenticate_user!
  before_action :current_user

  protect_from_forgery unless: -> { request.format.json? }
  def articles
  end



   def symptoms
       url = URI("https://sandbox-healthservice.priaid.ch/symptoms?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImV2cmFhMUB0Y25qLmVkdSIsInJvbGUiOiJVc2VyIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvc2lkIjoiMTM3MzYiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ZlcnNpb24iOiIyMDAiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL2xpbWl0IjoiOTk5OTk5OTk5IiwiaHR0cDovL2V4YW1wbGUub3JnL2NsYWltcy9tZW1iZXJzaGlwIjoiUHJlbWl1bSIsImh0dHA6Ly9leGFtcGxlLm9yZy9jbGFpbXMvbGFuZ3VhZ2UiOiJlbi1nYiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvZXhwaXJhdGlvbiI6IjIwOTktMTItMzEiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL21lbWJlcnNoaXBzdGFydCI6IjIwMjQtMDMtMjgiLCJpc3MiOiJodHRwczovL3NhbmRib3gtYXV0aHNlcnZpY2UucHJpYWlkLmNoIiwiYXVkIjoiaHR0cHM6Ly9oZWFsdGhzZXJ2aWNlLnByaWFpZC5jaCIsImV4cCI6MTcxMjM2MzMxOCwibmJmIjoxNzEyMzU2MTE4fQ.j8HQvJEG2hUAVyWXrP7t1sZnaP4xbFG5zVWdBvOGMsc&format=json&language=en-gb")


     @res = Net::HTTP.get_response(url)
     #puts @res.body
     @temp = JSON.parse(@res.body)

    #  @temp.each do |val|
     #   print val
      #  puts "\n"
       # print val["Name"]
      #end
    @temp1 = Base64.decode64(session[:session_id])
    rescue JSON::ParserError => e
      puts "Error parsing JSON: #{e.message}"
   end


   def destroy
    super
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

   def save_reports
    if params[:articles].present?
      puts articles_params

      selected_age = params[:articles][:Age].first.to_i
      selected_Gender = params[:articles][:Gender].first

      selected_symptoms = params[:articles][:symptoms]

      symptom_id_list = []
      symptom_name_list = []

      length = selected_symptoms.length()
      for symp in 0..length-1
        selected_symptoms[symp] = selected_symptoms[symp].split(",",0)

        symptom_id_list.push(selected_symptoms[symp][0])
        symptom_name_list.push(selected_symptoms[symp][1])
      end

      puts current_user.id
      @diag = Diagnostic.new(
        user_id: current_user.id,
        status: false
      )

      @diag.save
      puts  @diag.save

      @Symptom = Symptom.new(
          diagnostics_id: @diag.id,

          name: current_user.email,
          symptoms: symptom_name_list.to_s,
          Age: selected_age,
          Gender: selected_Gender,
          Symp_id: symptom_id_list.to_s
        )

        puts @Symptom

      @Symptom.save
      # currently returns true so that means it is getting saved


      # if @diag.save
        # @symptom = Symptom.new do |symptoms|
        #   symptoms.diagnostics_id = @diag.id
        #   symptoms.id = current_user.id
        #   symptoms.name = current_user.email
        #   symptoms.symptoms = symptom_name_list.to_s
        #   symptoms.Age =selected_age
        #   symptoms.Gender =  selected_Gender
        #   symptoms.Symp_id = symptom_id_list.to_s

        # end
        # @symptom.save

      # end
    end







        # @Symptom = Symptom.new(
        #   diagnostics_id: @diag.id,
        #   id: current_user.id,
        #   name: current_user.email,
        #   symptoms: symptom_name_list.to_s,
        #   Age: selected_age,
        #   Gender: selected_Gender,
        #   Symp_id: symptom_id_list.to_s
        # )

    #     if @Symptom.save
    #       redirect_to @Symptom, status: :created
    #       flash[:success] = "Symptoms sent!"
    #     else

    #       flash[:error] = "Validation errors: #{@Symptom.errors}"
    #     end
    #   else
    #     puts @diag.errors.full_messages
    #   end

    #   end
    #   head :no_content and return

    # end


  end
   private
   def articles_params
    if params[:articles].present?
    params.require(:articles)
   else
    {}
   end
   end
  end
