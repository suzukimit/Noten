class AbcPhrasesController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    @phrase = current_user.abc_phrases.build(abc_params)
    if @phrase.save
      flash[:success] = "New phrase has created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def update
    @phrase = AbcPhrase.find(params[:id])
    if @phrase.update(abc_params)
      flash[:success] = "Save succeed!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  # GET abc_phrases/:id
  def show
    @phrase = AbcPhrase.find(params[:id])
  end

  private
  def abc_params
    params.require(:abc_phrase).permit(:tytle, :meter, :length, :reference, :key, :abc)
  end
end
