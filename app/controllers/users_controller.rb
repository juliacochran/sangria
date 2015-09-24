class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  require 'users_helper'

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    accessToken = params[:accessToken]
    respond_to do |format|
      format.json { render json: UsersHelper::getUserId(accessToken) }
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  # deletes a user and all their boards, and all applications and interactions and notes for that board
  # we'll need to remove all contacts and companies once we figure out glassdoor etc.
  def destroy
    @boards = Board.where('user_id': params[:id])
    @boards.each do |board|
      @applications = Application.where('board_id': board.id)
      @applications.each do |application|
        @interactions = Interaction.where('application_id': application.id)
        @interactions.each do |interaction|
          interaction.destroy
        end
        application.destroy
      end
      @notes = Note.where('board_id': board.id)
      @notes.each do |note|
        note.destroy
      end
      board.destroy
    end
    @jobs = Job.where('user_id': params[:id])
    @jobs.each do |job|
      job.destroy
    end
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :seeking, :settings)
    end
end
