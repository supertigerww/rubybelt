class JoinsController < ApplicationController
    before_action :user_authorized, only:[:create]

    def create
        Join.create(user: current_user,organization:Organization.find(params[:organization_id]))
        redirect_to "/groups/#{params[:organization_id]}"
    end

    def destroy
        Join.find_by(user: current_user,organization:Organization.find(params[:organization_id])).destroy
        redirect_to "/groups/#{params[:organization_id]}"
    end
end
