class AbcPhrasesController < ApplicationController
  before_action :reject_not_logged_in_user

  def create
    #TODO: createに失敗した場合はalertを出す
    @phrase = AbcPhrase.create(
                              user_id: session[:user_id],
                              title: "new",
                              meter: "4/4",
                              length: "1/8",
                              reference: "",
                              key: "C",
                              abc: "c"
                              )
  end

  def update
    @phrase = AbcPhrase.find(params[:id])
    if @phrase.update(abc_params)
      redirect_to root_url
    else
      @phrases  = AbcPhrase.where(user_id: current_user).order(updated_at: :desc)
      render 'static_pages/home'
    end
  end

  # GET abc_phrases/:id
  def show
    @phrase = AbcPhrase.find(params[:id])
  end

  # DELETE abc_phrases
  def destroy
    @phrase = AbcPhrase.find_by(id: params[:id])
    return redirect_to root_url if @phrase.nil?
    @phrase.destroy
  end

  private
  def abc_params
    params.require(:abc_phrase).permit(:title, :meter, :length, :reference, :key, :abc)
  end
end
