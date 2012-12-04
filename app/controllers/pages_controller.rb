class PagesController < ApplicationController
  def home
  	@members = Member.all
  end

  def about
  end
end
