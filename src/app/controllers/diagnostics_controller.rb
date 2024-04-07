class DiagnosticsController < ApplicationController
  require 'base64'
  before_action :authenticate_healthcare!
  before_action :current_healthcare

  protect_from_forgery unless: -> { request.format.json? }
  def articles

    Diagnostic.all.each do |proposedDiagnosis|
      symptom_row = Symptom.where(diagnostics_id: proposedDiagnosis.id).first

      #Finding Symptoms ID and Seperating symptoms ID  by comma
      we_foundsymptom_Id = symptom_row.Symp_id.gsub(/[\[\]"]/, "").split(", ").join(",")

      # Finding  the user Age
       user_age = symptom_row.Age

      #finding gender
      user_gender = symptom_row.Gender.downcase


      birth_year = Date.today.year - user_age.to_i

      puts user_gender
      puts birth_year
      puts we_foundsymptom_Id

      token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImV2cmFhMUB0Y25qLmVkdSIsInJvbGUiOiJVc2VyIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvc2lkIjoiMTM3MzYiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ZlcnNpb24iOiIyMDAiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL2xpbWl0IjoiOTk5OTk5OTk5IiwiaHR0cDovL2V4YW1wbGUub3JnL2NsYWltcy9tZW1iZXJzaGlwIjoiUHJlbWl1bSIsImh0dHA6Ly9leGFtcGxlLm9yZy9jbGFpbXMvbGFuZ3VhZ2UiOiJlbi1nYiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvZXhwaXJhdGlvbiI6IjIwOTktMTItMzEiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL21lbWJlcnNoaXBzdGFydCI6IjIwMjQtMDMtMjgiLCJpc3MiOiJodHRwczovL3NhbmRib3gtYXV0aHNlcnZpY2UucHJpYWlkLmNoIiwiYXVkIjoiaHR0cHM6Ly9oZWFsdGhzZXJ2aWNlLnByaWFpZC5jaCIsImV4cCI6MTcxMjUzODIxMywibmJmIjoxNzEyNTMxMDEzfQ.Qk4pXeJmSlHWUUTJiG2E3_GANr9BiakUMYD69Nue7ZE"



     url = URI("https://sandbox-healthservice.priaid.ch/diagnosis?symptoms=[#{we_foundsymptom_Id}]&gender=#{user_gender}&year_of_birth=#{birth_year}&token=#{token}")
    puts url

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
    puts " I made it here "
    puts birth_year
    puts user_gender
    puts symptom_id_array

    puts " Now I am here "
  end



  def Diagnose_user
  end

  def create


  end
end




 # @res = Net::HTTP.get_response(url)
  #puts @res.body
 # @temp = JSON.parse(@res.body)

 #  @temp.each do |val|
  #   print val
   #  puts "\n"
    # print val["Name"]
   #end
# @temp1 = Base64.decode64(session[:session_id])
 #rescue JSON::ParserError => e
 #  puts "Error parsing JSON: #{e.message}"
#end

end
end
