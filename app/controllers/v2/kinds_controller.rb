module V2
  class KindsController < ApplicationController
    # TOKEN = "secret123"

    # include ActionController::HttpAuthentication::Digest::ControllerMethods
    include ActionController::HttpAuthentication::Token::ControllerMethods

    # USERS = {'kaio' => Digest::MD5.hexdigest(['kaio', 'Application', 'secret'].join(':'))}

    before_action :set_kind, only: %i[show update destroy]
    before_action :authenticate

    # GET /kinds
    def index
      @kinds = Kind.all
      render json: @kinds
      # render json: {status: 'SUCCESS', message: 'Loaded kinds', data: @kinds}, status: :ok, include: {contacts: {only: [:name, :email]}}

      # include: :contacts -> irá mostrar todos os campos
    end

    # GET /kinds/1
    def show
      render json: @kind
    end

    # POST /kinds
    def create
      @kind = Kind.new(kind_params)

      if @kind.save
        render json: @kind, status: :created, location: @kind
      else
        render json: @kind.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /kinds/1
    def update
      if @kind.update(kind_params)
        render json: @kind
      else
        render json: @kind.errors, status: :unprocessable_entity
      end
    end

    # DELETE /kinds/1
    def destroy
      @kind.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_kind
      if params[:contact_id]
        @kind = Contact.find(params[:contact_id]).kind
        return @kind
      end

      @kind = Kind.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kind_params
      params.require(:kind).permit(:description)
    end

    # def authenticate
    #   authenticate_or_request_with_http_digest("Application") do |username|
    #     USERS[username]
    #   end
    # end

    def authenticate
      authenticate_or_request_with_http_token do |token, _options|
        secret = 'mysecret2'
        JWT.decode token, secret, true, { algorithm: 'HS256' }
      end
    end
  end
end
