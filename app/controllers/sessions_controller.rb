class SessionsController < ApplicationController

   def new
   end

   def create
      username = params[:username]
      password = params[:password]

      user = User.find_by username: username

      if user.try(:authenticate, password)
         session[:user_id] = user.id
         redirect_to root_path
      else
         redirect_to sign_in_path, alert: "Username & Password Invalid"
      end
   end

   def destroy
      session[:user_id] = nil
      redirect_to root_path
   end
end
