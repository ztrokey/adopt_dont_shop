class Admin::ApplicationsController < ApplicationController
   def show
    @application = Application.find(params[:id])
  end

  def update
    application = Application.find(params[:id])
    application.update(application_params)
    redirect_to "/admin/applications/#{application.id}"
  end

  private

  def application_params
    params.permit(:name, :street_address, :city, :state, :zip_code, :description, :status)
  end
end