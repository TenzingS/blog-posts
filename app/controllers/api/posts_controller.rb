class Api::PostsController < ApplicationController

  def success                                          #route: api/ping
    render json: { "success": true }, status: 200     
  end

  def index                                            #route: api/post
    if request.query_parameters["tags"]                #checking for the tags param

    vars = request.query_parameters
    posts = Post.all

    if vars["tags"].include?(",")

      tags = vars["tags"].split(/,/)
      results = posts.select do |post|
        (tags & post[:tags]).size > 0
      end

      render json: results

    else
      tags = Array(vars["tags"])
      results = posts.select do |post|
        (tags & post[:tags]).size > 0
      end

      if vars["sortBy"]                                  #checking for sortBy and direction
        
        if vars["sortBy"] == "id"
          if vars["direction"] =="asc"
            render json: results.sort_by{ |i| i[:id]}
          elsif vars["direction"] == "desc"
            render json: results.sort_by{ |i| i[:id]}.reverse
          else render json: results.sort_by{ |i| i[:id]}
          end

        elsif vars["sortBy"] == "reads"
          if vars["direction"] == "asc"
            render json: results.sort_by{ |i| i[:reads]}
          elsif vars["direction"] == "desc"
            render json: results.sort_by{ |i| i[:reads]}.reverse
          else render json: results.sort_by{ |i| i[:reads]}
        end

        elsif vars["sortBy"] == "likes"
          if vars["direction"] =="asc"
            render json: results.sort_by{ |i| i[:likes]}
          elsif vars["direction"] == "desc"
            render json: results.sort_by{ |i| i[:likes]}.reverse
          else render json: results.sort_by{ |i| i[:likes]}
        end

        elsif vars["sortBy"] == "popularity"
          if vars["direction"] =="asc"
          render json: results.sort_by{ |i| i[:popularity]}
          elsif vars["direction"] == "desc"
            render json: results.sort_by{ |i| i[:popularity]}.reverse
          else render json: results.sort_by{ |i| i[:popularity]}
        end

        else render json: { "error": "sortBy parameter is invalid" }, status: 400
        end

      else
      render json: results
      end

    end
  else
    render json: { "error": "Tags parameter is required" }, status: 400
  end
  end #index

end