class VenuesController < ApplicationController
  def index
    matching_venues = Venue.all
    @venues = matching_venues.order(:created_at)
    render({ template: "venue_templates/venue_list" })
  end

  def show
    venue_id = params.fetch("venue_id")
    matching_venues = Venue.where({ id: venue_id })
    @the_venue = matching_venues.at(0)
    render({ template: "venue_templates/details" })
  end

  def create
    venue = Venue.new
    venue.address = params.fetch("query_address")
    venue.name = params.fetch("query_name")
    venue.neighborhood = params.fetch("query_neighborhood")
    venue.save

    redirect_to("/venues/#{venue.id}")
  end

  def update
    venue_id = params.fetch("venue_id")
    matching_venues = Venue.where({ id: venue_id })
    the_venue = matching_venues.at(0)
    the_venue.address = params.fetch("query_address")
    the_venue.name = params.fetch("query_name")
    the_venue.neighborhood = params.fetch("query_neighborhood")
    the_venue.save

    redirect_to("/venues/#{the_venue.id}")
  end

  def destroy
    venue_id = params.fetch("venue_id")
    matching_venues = Venue.where({ id: venue_id })
    the_venue = matching_venues.at(0)
    the_venue.destroy

    redirect_to("/venues")
  end
end
