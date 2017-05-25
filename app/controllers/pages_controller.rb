class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @pastries = Pastry.all.sample(6)
  end
end
