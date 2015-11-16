class InteractionsController < ApplicationController
  before_action :set_interaction, only: [:show, :show_modal, :edit, :edit_modal, :update, :destroy]
  before_filter :logged_in?

  # GET /interactions
  # GET /interactions.json
  def index
    @interactions = Interaction.all
  end

  # GET /interactions/1
  # GET /interactions/1.json
  def show
    render 'show', :layout => nil
  end

  # GET /interactions/1/show_modal
  # GET /interactions/1/show_modal.json
  def show_modal
    @category = Interaction::CATEGORIES[@interaction.category]
    render 'show', :layout => nil
  end

  # GET /interactions/new
  def new
    @interaction = Interaction.new
    @user = current_user
    @contacts = @user.contacts
    @categories = Interaction::CATEGORIES
  end

  # GET /interactions/new_modal
  def new_modal
    @interaction = Interaction.new
    @user = current_user
    @application = Application.find(params[:application_id].to_i)
    render 'new', :layout => nil
  end

  def followed_up
    @interaction = Interaction.find_by_id(params[:id])
    @interaction.followup = true
    @interaction.save
    redirect_to current_user.boards.last
  end

  # GET /interactions/1/edit
  def edit
  end

  # GET /interactions/1/edit_modal
  # GET /interactions/1/edit_modal.json
  def edit_modal
    render 'edit', :layout => nil
  end

  # POST /interactions
  # POST /interactions.json
  """
  Case 1: create interaction without contact
  Case 2: create interaction with new contact
    Case 2.1: new contact with same company as application
    Case 2.2: new contact with new company
    Case 2.2: new contact with existing company
  Case 3: create interaction with existing contact

  As of the commit where this message appears it works for all cases
  """
  def create

    @user = current_user
    @application = Application.find(interaction_params[:application_id].to_i)
    save = {:company => false, :contact => false}

    if contact_params[:name].present?
      # we don't have autofill on interaction add yet so we're creating new
      if company_params[:name].present?
        # if they're adding a new company
        @company = @user.companies.create(company_params)
        save[:company] = true
      else
        # if they're using the same company as the application
        @company = Company.find(contact_params[:company_id].to_i)
      end
      @contact = @company.contacts.create(contact_params)
      save[:contact] = true

      # params are mutable so I'm making an extra with the new contact_id
      new_interaction_params = {}
      interaction_params.each do |key, value|
        new_interaction_params[key] = value
      end
      new_interaction_params[:contact_id] = @contact.id
      @interaction = @application.interactions.create(new_interaction_params)

    else
      # create without contact or if they've filled in existing contact in the dropdown
      @interaction = @application.interactions.create(interaction_params)
    end

    respond_to do |format|
      if save[:company]
        unless @company.save
          logger.debug "fuuuck company didn't save #{@company.inspect}"
          logger.debug "fuuuck company didn't save #{@contact.inspect}"
          logger.debug "fuuuck company didn't save #{@company.errors.inspect}"
        end
      end
      if save[:contact]
        unless @contact.save
          logger.debug "fuuuck contact didn't save #{@company.inspect}"
          logger.debug "fuuuck contact didn't save #{@contact.inspect}"
          logger.debug "fuuuck contact didn't save #{@contact.errors.inspect}"
        end
      end
      if @interaction.save
        format.html { redirect_to :back }
        format.json { render :show, status: :created, location: @interaction }
      else
        format.html { render :new }
        format.json { render json: @interaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interactions/1
  # PATCH/PUT /interactions/1.json
  def update
    respond_to do |format|
      if @interaction.update(interaction_params)
        format.html { redirect_to :back }
        format.json { render :show, status: :ok, location: @interaction }
      else
        format.html { render :edit }
        format.json { render json: @interaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interactions/1
  # DELETE /interactions/1.json
  def destroy
    @interaction.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interaction
      @interaction = Interaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interaction_params
      params.require(:interaction).permit(:application_id, :title, :category, :date, :contact_id, :details, :followup)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:id, :name, :location, :website, :logo)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:company_id, :name, :email, :phone_number, :role)
    end
end
