class AdminController < ApplicationController
	before_filter :require_admin
  
  def members
  	@members = Member.all
  	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @members }
  	end
  end

  def events
  	@events = Event.all
  	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

end
