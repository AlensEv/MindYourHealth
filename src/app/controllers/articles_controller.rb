class ArticlesController < ApplicationController

 #authenticating and keeping user dashbpards seperate on sign in
  before_action :authenticate_user!, only: [:users]

  before_action :authenticate_admin!, only: [:admin]
  before_action :authenticate_healthcare!, only: [:healthcare]

  def symptoms
      url = URI("https://sandbox-healthservice.priaid.ch/symptoms?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImV2cmFhMUB0Y25qLmVkdSIsInJvbGUiOiJVc2VyIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvc2lkIjoiMTM3MzYiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ZlcnNpb24iOiIyMDAiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL2xpbWl0IjoiOTk5OTk5OTk5IiwiaHR0cDovL2V4YW1wbGUub3JnL2NsYWltcy9tZW1iZXJzaGlwIjoiUHJlbWl1bSIsImh0dHA6Ly9leGFtcGxlLm9yZy9jbGFpbXMvbGFuZ3VhZ2UiOiJlbi1nYiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvZXhwaXJhdGlvbiI6IjIwOTktMTItMzEiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL21lbWJlcnNoaXBzdGFydCI6IjIwMjQtMDMtMjgiLCJpc3MiOiJodHRwczovL3NhbmRib3gtYXV0aHNlcnZpY2UucHJpYWlkLmNoIiwiYXVkIjoiaHR0cHM6Ly9oZWFsdGhzZXJ2aWNlLnByaWFpZC5jaCIsImV4cCI6MTcxMTU5NDY1NiwibmJmIjoxNzExNTg3NDU2fQ.wP-ReKQFPrwHJGxrFsdfr6Z6377HVYHjLCEOa2yr26E&format=json&language=en-gb")


    @res = Net::HTTP.get_response(url)
    #puts @res.body
    @temp = JSON.parse(@res.body)

    @temp.each do |val|
      print val
      puts "\n"
      print val["Name"]
      puts "\n"
    end
    #length = temp
    #for entry in temp do

     # puts entry



    #end
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
