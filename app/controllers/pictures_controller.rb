class PicturesController < ApplicationController

   before_action :authenticate_user!

   def index
      @pictures = @current_user.pictures.page(params[:page]).per(6)
   end

   def new
      @picture = Picture.new
   end

   def create
      @picture = Picture.new params.require(:picture).permit(:photo, :url)
      @picture.user = @current_user
      if @picture.save
         redirect_to root_path, notice: "Picture Uploaded"
      else
         render :new
      end
   end

   def authenticate_user!

      if signed_in?
         @current_user = User.find session[:user_id]
      else
         redirect_to sign_in_path
      end

     end

     def signed_in?
      if session[:user_id].to_i > 0
         return true
      else
         return false
      end
     end

end
