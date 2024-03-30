class ArticlesController < ApplicationController
  require 'base64'
  before_action :authenticate_user!
  before_action :current_user


  def articles
  end



   def symptoms
       url = URI("https://sandbox-healthservice.priaid.ch/symptoms?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImV2cmFhMUB0Y25qLmVkdSIsInJvbGUiOiJVc2VyIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvc2lkIjoiMTM3MzYiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ZlcnNpb24iOiIyMDAiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL2xpbWl0IjoiOTk5OTk5OTk5IiwiaHR0cDovL2V4YW1wbGUub3JnL2NsYWltcy9tZW1iZXJzaGlwIjoiUHJlbWl1bSIsImh0dHA6Ly9leGFtcGxlLm9yZy9jbGFpbXMvbGFuZ3VhZ2UiOiJlbi1nYiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvZXhwaXJhdGlvbiI6IjIwOTktMTItMzEiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL21lbWJlcnNoaXBzdGFydCI6IjIwMjQtMDMtMjgiLCJpc3MiOiJodHRwczovL3NhbmRib3gtYXV0aHNlcnZpY2UucHJpYWlkLmNoIiwiYXVkIjoiaHR0cHM6Ly9oZWFsdGhzZXJ2aWNlLnByaWFpZC5jaCIsImV4cCI6MTcxMTgxNDg0NSwibmJmIjoxNzExODA3NjQ1fQ.iubznooUpuxLIMTn6tjJD-b2pSnQg0GkHkzyVW-xdkw&format=json&language=en-gb")


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
    puts "HELLO"
    selected_symptoms = params[:articles][:symptoms]
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
