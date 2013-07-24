class ReceiptsController < ApplicationController
  def create
    flash.keep[:name]    = params[:name]    || flash[:name]
    flash.keep[:bdate]   = params[:bdate]   || flash[:bdate]
    flash.keep[:passp]   = params[:passp]   || flash[:passp]
    flash.keep[:address] = params[:address] || flash[:address]
    flash.keep[:citizen] = params[:citizen] || flash[:citizen]
    flash.keep[:amount]  = params[:amount]  || flash[:amount]
    respond_to do |format|
       format.html
       format.pdf do
         render pdf: "receipt", layout: "pdf.html", margin: {left: '0', right: '0'}
       end
     end
  end
  # def show
  #   respond_to do |format|
  #      format.html
  #      format.pdf do
  #        render pdf: "receipt", layout: "pdf.html"
  #      end
  #    end
  # end
end