class LondonusersController < ApplicationController

    def index
        londonusers = Londonuser.all
        render json: londonusers, except: [:created_at, :updated_at]
    end

end
