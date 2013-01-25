class MembershipsController < ApplicationController
  before_filter :require_user
  before_filter :get_user
  before_filter :redirect_if_member, :only => :new

  def get_user
    @user = User.find(params[:user_id])
  end

  def index
    @memberships = Membership.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @memberships }
    end
  end


  def show
    @membership = @user.membership

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @membership }
    end
  end


  def new
    @membership = Membership.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @membership }
    end
  end


  def edit
    @membership = @user.membership

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @membership }
    end
  end


  def create
    @membership = Membership.new(params[:membership])

    respond_to do |format|
      if @membership.save
        format.html { redirect_to @user, notice: 'Thank you for becoming a member!' }
        format.json { render json: @membership, status: :created, location: @membership }
      else
        format.html { render action: "new" }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @membership = @user.membership

    respond_to do |format|
      if @membership.save
        format.html { redirect_to @user, notice: 'Membership was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy

    respond_to do |format|
      format.html { redirect_to memberships_url }
      format.json { head :no_content }
    end
  end

  def redirect_if_member
    if @user.membership
     redirect_to @user, :notice => "You already have a membership." 
    end
  end

end
