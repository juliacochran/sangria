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
    @application = Application.find(@interaction.application_id)
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
    RemindersController.send_followup_reminders
    redirect_to @interaction.application.board
  end

  # GET /interactions/1/edit
  def edit
  end

  # GET /interactions/1/edit_modal
  # GET /interactions/1/edit_modal.json
  def edit_modal
    @user = current_user
    @interaction = Interaction.find(params[:id].to_i)
    @application = Application.find(@interaction.application_id)
    render 'edit', :layout => nil
  end

  # POST /interactions
  # POST /interactions.json
  """
  Case 1: create interaction without contact
  Case 2: create interaction with new contact
  Case 3: create interaction with existing contact
  """
  def create

    @user = current_user
    @application = Application.find(interaction_params[:application_id].to_i)
    save_contact = false

    if contact_params[:name].present?
      @contact = @application.company.contacts.create(contact_params)
      save_contact = true

      new_interaction_params = deep_clone_params(interaction_params)
      new_interaction_params[:contact_id] = @contact.id
      @interaction = @application.interactions.create(new_interaction_params)
    else
      # create without contact or if they've filled in existing contact in the dropdown
      @interaction = @application.interactions.create(interaction_params)
    end

    respond_to do |format|
      if save_contact
        unless @contact.save
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
  """
  Case 1: update interaction without contact
  Case 2: update interaction with new contact
  Case 3: update interaction with existing contact
  """
  def update
    @user = current_user
    @interaction = Interaction.find(params[:id])
    @application = @interaction.application
    save_contact = false

    if contact_params[:name].present?
      @contact = @application.company.contacts.create(contact_params)
      save_contact = true

      new_interaction_params = deep_clone_params(interaction_params)
      new_interaction_params[:contact_id] = @contact.id
    end


    respond_to do |format|
      if save_contact
        unless @contact.save
          logger.debug "shiiit contact didn't save #{@contact.inspect}"
          logger.debug "shiiit contact didn't save #{@contact.errors.inspect}"
        end
      end
      # if we're making a new contact, we have to override the interaction params so we use the new one
      if @interaction.update((save_contact) ? new_interaction_params : interaction_params)
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
    def contact_params
      params.require(:contact).permit(:company_id, :name, :email, :phone_number, :role)
    end
end
