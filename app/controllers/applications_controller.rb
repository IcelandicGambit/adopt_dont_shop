class ApplicationsController < ApplicationController

  def create
    @application = Application.new(application_params)
    @application.set_in_progress
    if @application.save
      flash[:success] = "Your application is in progress"
      redirect_to "/applications/#{@application.id.to_s}"
    else
      flash[:error] = @application.errors.full_messages.to_sentence
      render :new
    end
  end

  def index
    @applications = Application.all
  end

  def show
    if params[:search].present?
      @pets = Pet.search(params[:search])
    end
    @application = Application.find(params[:id])
  end

  def edit
    @application = Application.find(params[:id])
  end

  def new
  end

  def update
    @application = Application.find(params[:id])
    if params[:pet_id].present?
      @application.update(application_params)
      @application.pet_applications.create(pet_id: params[:pet_id]) #passing in pet id that user selects so that they can be joined upon update
    else
      if params[:description].blank?
        flash[:error] = "You must enter a description"
      else
        @application.set_pending
        @application.update(application_params)
      end
    end
    redirect_to "/applications/#{@application.id}"
  end

  private

  def application_params
    params.permit(:name, :address, :city, :state, :zip_code, :description)
  end

end