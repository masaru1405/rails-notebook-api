class AuthsController < ApplicationController

   def create
      secret = 'mysecret2'
      payload = {data: params[:name], exp: Time.now.to_i + 30}
      token = JWT.encode payload, secret, 'HS256'
      render json: {token: token}
   end
end
