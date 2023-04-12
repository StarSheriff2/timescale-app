class StaticPagesController < ApplicationController
  def home
    PageLoad.create(:user_agent => request.user_agent)
  end
end
