class StaticPagesController < ApplicationController
  def home
    return if !logged_in?
    @phrase  = current_user.abc_phrases.build
  end
end
