class AbcPhrasesController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    @phrase = current_user.abc_phrases.build(params.require(:abc_phrase).permit(:tytle, :meter, :length, :reference, :key, :abc))
    if @phrase.save
      flash[:success] = "New phrase has created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def update
   redirect_to root_url
  end

  # GET abc_phrases/:id
  def show
    @phrase = AbcPhrase.find(params[:id])
  end
end
