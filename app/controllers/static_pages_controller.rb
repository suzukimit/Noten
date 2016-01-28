class StaticPagesController < ApplicationController
  def home
    return if !logged_in?
    @phrase  = current_user.abc_phrases.build
    @phrases = AbcPhrase.where(user_id: current_user).order(updated_at: :desc)
  end
end
