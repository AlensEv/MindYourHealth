class ArticlesController < ApplicationController
  #This page houses my APIs and executes the calls once conditions are met
  #This is where the diagnostics

  require 'base64'
  before_action :authenticate_user!
  before_action :current_user

  protect_from_forgery unless: -> { request.format.json? }

  def GetDiag

    puts params
    #splitting the symptoms ID in the format of 4,4,4,
    we_foundsymptom_Id = params[:symptom_ids].gsub(/[\[\]"]/, "").split(", ").join(",")
    puts we_foundsymptom_Id
    the_diag = Diagnostic.find(params[:diagnostics_id])

    we_foundsymptom_names = params[:symptoms]

      #finding gender
      user_gender = params[:gender]


      #Because the api takes the year as age we have to calulated user age
      birth_year = Date.today.year - params[:age].to_i


    #Here I have to concatinate the user symptoms, gender, age into the api url so it makes sense to have a seperate key
    #when refereshing the key

      token = "Your Duagnostics Api key"


     url = URI("https://sandbox-healthservice.priaid.ch/diagnosis?symptoms=[#{we_foundsymptom_Id}]&gender=#{user_gender}&year_of_birth=#{birth_year}&token=#{token}&format=json&language=en-gb")


    @res = Net::HTTP.get_response(url)
    the_user = User.find(the_diag.user_id)

    #value checking
    puts the_user

    puts url
    puts @res

    puts we_foundsymptom_names

    the_user_report = Report.new(user_id: the_user.id)
    # Here when the user symptoms arent valid for the api , we handle this by letting them know

    if @res.body == "[]"
      the_user_report.description = "This symptoms are not diagnosable. Sorry! Please try a new set of symptoms."
    else
      json_result = JSON.parse(@res.body)
      diag_saved_here =  json_result.map { |save_diagn| save_diagn['Issue']['Name'] }.join(', ')

      puts diag_saved_here
      #Formating how the sees their resulted diagnosis

      the_user_report.description = " #{we_foundsymptom_names} Here is your possible diagnosis: #{diag_saved_here}"
      # the_user_report.description = "Your symptoms were #{we_foundsymptom_names}. Here is your diagnosis: #{diag_saved_here}"



    end
    #saves to the reports database for users so users can actually see their proposed diagnostic
    the_user_report.save!
    puts the_user_report.description
    #Changes the status of the button once submitted
    the_diag.status = true
    the_diag.save!
    #reloads page once a diagnostic is submitted
    redirect_to diagnosticso_page_path
  end

# managing symptoms
   def symptoms
       url = URI("Symptomd api URL ")


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

#looking for params in order to start processing user inputs
    if params[:articles].present?
      puts articles_params
      #processing when users select age and gender
      selected_age = params[:articles][:Age].first.to_i
      selected_Gender = params[:articles][:Gender].first

      #processing when users selects symptoms

      selected_symptoms = params[:articles][:symptoms]
      # Saves the symptoms names and id into  arrays
      symptom_id_list = []
      symptom_name_list = []

      length = selected_symptoms.length()
      for symp in 0..length-1
        #Splitting the symptom id and name in to ["134","Symptoms...."] format
        selected_symptoms[symp] = selected_symptoms[symp].split(",",0)

        symptom_id_list.push(selected_symptoms[symp][0])
        symptom_name_list.push(selected_symptoms[symp][1])
      end


      puts current_user.id
      #Saving the user id and status in the diagnstics databasetable
      @diag = Diagnostic.new(
        user_id: current_user.id,
        status: false
      )
      #debugging
      @diag.save
      puts  @diag.save
    # #Saving  name: current_user.email,
    #       symptoms: symptom_name_list.to_s,
    #       Age: selected_age,
    #       Gender: selected_Gender,
    #       Symp_id: symptom_id_list.to_s in the symptoms databasetable
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
