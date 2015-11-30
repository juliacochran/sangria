class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_filter :logged_in?
  require 'companies_helper'

  # GET /companies
  # GET /companies.json
  def index
    @user = current_user
    @companies = Company.where('user_id' => @user.id)
  end

  # GET /companies/1
  # GET /companies/1.json
  def show

  end

  def search
    company_query = params[:q]
    response = CompaniesHelper::getCompanyInfo(company_query,request.remote_ip, request.env['HTTP_USER_AGENT'])
    respond_to do |format|
      format.json { render json: response}
    end
  end

  # GET /companies/new
  def new
    @company_names = Company.pluck(:name)
    @companies = Company.all.to_json
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    #TODO: make sure its getting the user_id
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to :back }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to :back }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:user_id, :name, :location, :website, :logo, :isGlassdoor)
    end
end
