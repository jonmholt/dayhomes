class SearchesController < ApplicationController

  def index
    # user goes directy to index page without search params
    if params[:search].blank?
      # display all of the full and part time
      day_homes = DayHome.with_availability_uniq(['Full-time', 'Part-time']).all
    else
      # apply the params to the search model
      @search = Search.new(params[:search])

      # If any errors, show an error message
      if @search.errors.count > 0
        flash.now[:error] = "Unable to find dayhomes within that criteria, please modifying the critera to be less restrictive"
      end

      # set the pins for gmaps
      day_homes = @search.dayhomes
    end

    # style and generate pins
    @day_homes = style_dayhomes(day_homes)

    # make sure the search object keeps its persistance
    @advanced_search = params.has_key?(:search) ? @search : Search.new
  end

private
  def style_dayhomes(day_homes)
    day_homes.to_gmaps4rails do |dayhome, marker|
      marker.infowindow render_to_string(:partial => "pin", :locals => { :dayhome => dayhome})
      marker.title dayhome.name
      marker.picture({ :picture => "/assets/dayhome.png",
                       :width => 32,
                       :height => 37
                     })

    end
  end

end