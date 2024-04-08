class ArticlesController < ApplicationController
  require 'base64'
  before_action :authenticate_user!
  before_action :current_user

  protect_from_forgery unless: -> { request.format.json? }

  def GetDiag

    puts params
    we_foundsymptom_Id = params[:symptom_ids].gsub(/[\[\]"]/, "").split(", ").join(",")
    puts we_foundsymptom_Id
    the_diag = Diagnostic.find(params[:diagnostics_id])

    we_foundsymptom_names = params[:symptoms]

      #finding gender
      user_gender = params[:gender]



      birth_year = Date.today.year - params[:age].to_i


      token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImV2cmFhMUB0Y25qLmVkdSIsInJvbGUiOiJVc2VyIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvc2lkIjoiMTM3MzYiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ZlcnNpb24iOiIyMDAiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL2xpbWl0IjoiOTk5OTk5OTk5IiwiaHR0cDovL2V4YW1wbGUub3JnL2NsYWltcy9tZW1iZXJzaGlwIjoiUHJlbWl1bSIsImh0dHA6Ly9leGFtcGxlLm9yZy9jbGFpbXMvbGFuZ3VhZ2UiOiJlbi1nYiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvZXhwaXJhdGlvbiI6IjIwOTktMTItMzEiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL21lbWJlcnNoaXBzdGFydCI6IjIwMjQtMDMtMjgiLCJpc3MiOiJodHRwczovL3NhbmRib3gtYXV0aHNlcnZpY2UucHJpYWlkLmNoIiwiYXVkIjoiaHR0cHM6Ly9oZWFsdGhzZXJ2aWNlLnByaWFpZC5jaCIsImV4cCI6MTcxMjU5MzgxMCwibmJmIjoxNzEyNTg2NjEwfQ.3kDuFp9TEaxjteeKm5SdTTfGUVXHxWoQbmBp52s7_WQ"


     url = URI("https://sandbox-healthservice.priaid.ch/diagnosis?symptoms=[#{we_foundsymptom_Id}]&gender=#{user_gender}&year_of_birth=#{birth_year}&token=#{token}&format=json&language=en-gb")


    @res = Net::HTTP.get_response(url)
    the_user = User.find(the_diag.user_id)
    puts "HELLO"
    puts the_user
    puts "HELLO"
    puts url
    puts @res




    puts we_foundsymptom_names

    the_user_report = Report.new(user_id: the_user.id)

    if @res.body == "[]"
      the_user_report.description = "This symptoms are not diagnosable. Sorry! Please try a new set of symptoms."
    else
      json_result = JSON.parse(@res.body)
      diag_saved_here =  json_result.map { |save_diagn| save_diagn['Issue']['Name'] }.join(', ')
      # professional_to_see = json_result.map { |save_diagn| save_diagn['Issue']['Specialisation'] }.join(', ')

      puts diag_saved_here

      the_user_report.description = " #{we_foundsymptom_names} Here is your possible diagnosis: #{diag_saved_here}    "
      # the_user_report.description = "Your symptoms were #{we_foundsymptom_names}. Here is your diagnosis: #{diag_saved_here}"



    end

    the_user_report.save!
    puts the_user_report.description
    the_diag.status = true
    the_diag.save!

    redirect_to diagnosticso_page_path
  end


   def symptoms
       url = URI("https://sandbox-healthservice.priaid.ch/symptoms?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImV2cmFhMUB0Y25qLmVkdSIsInJvbGUiOiJVc2VyIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvc2lkIjoiMTM3MzYiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ZlcnNpb24iOiIyMDAiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL2xpbWl0IjoiOTk5OTk5OTk5IiwiaHR0cDovL2V4YW1wbGUub3JnL2NsYWltcy9tZW1iZXJzaGlwIjoiUHJlbWl1bSIsImh0dHA6Ly9leGFtcGxlLm9yZy9jbGFpbXMvbGFuZ3VhZ2UiOiJlbi1nYiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvZXhwaXJhdGlvbiI6IjIwOTktMTItMzEiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL21lbWJlcnNoaXBzdGFydCI6IjIwMjQtMDMtMjgiLCJpc3MiOiJodHRwczovL3NhbmRib3gtYXV0aHNlcnZpY2UucHJpYWlkLmNoIiwiYXVkIjoiaHR0cHM6Ly9oZWFsdGhzZXJ2aWNlLnByaWFpZC5jaCIsImV4cCI6MTcxMjU5NTYxMCwibmJmIjoxNzEyNTg4NDEwfQ.sLr84TxKMo9aEOv67NyWcdzz23qVTCsaA4lvAW_AQGM&format=json&language=en-gb")


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








      puts "hello "
      puts params
      new_symptoms = params[:symptom_names]
      puts new_symptoms

      puts "bye"



     redirect_to symptoms_page_path




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






    end





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
