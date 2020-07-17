class MooniesController < ApplicationController
  def show
    @user = User.find(params[:id])
    p @user
  end
end