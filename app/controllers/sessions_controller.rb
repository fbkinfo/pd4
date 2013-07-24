# class SessionsController < ApplicationController
#   def create
#     user = User.from_omniauth env["omniauth.auth"]
#     session[:user_id] = user.id
#     redirect_to root_url, notice: t('logged_in')
#   end
#   
#   def failure
#     redirect_to root_url, alert: t(params[:message])
#   end
#   
#   def destroy
#     session[:user_id] = nil
#     redirect_to root_url, notice: t('logged_out')
#   end
# end