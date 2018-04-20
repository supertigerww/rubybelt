class OrganizationsController < ApplicationController
  before_action :user_authorized, only: [:index, :show]
  def index
    current_user = current_user()
    @all_organizations = Organization.all
  end

  def create
    organization = Organization.create(organization_params)

    if organization.valid?
      Join.create(user: current_user,organization:Organization.find_by(name:organization_params[:name]))
      redirect_to "/groups"
    else
      flash[:errors] = organization.errors.full_messages
      redirect_to "/groups"
    end
  end

  def show
    current_user = current_user()
    @current_organization = Organization.find(params[:organization_id])
    @ids = current_user.organizations_joined_ids
  end

  def delete
    Organization.find(params[:organization_id]).destroy
    redirect_to "/groups"
  end

  private
    def organization_params
      params.require(:organization).permit(:name, :description, :user_id)
    end
end
