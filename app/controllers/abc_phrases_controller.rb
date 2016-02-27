class AbcPhrasesController < ApplicationController
  before_action :reject_not_logged_in_user

  # POST abc_phrases
  def create
    respond_to do |format|
      # 0件の状態でsaveした場合
      format.html {
        @phrase  = current_user.abc_phrases.build(abc_params)
        if @phrase.save
          redirect_to root_url
        else
          @phrases  = AbcPhrase.where(user_id: current_user).order(updated_at: :desc)
          render 'static_pages/home'
        end
      }
      # plusボタンでajaxで追加する場合
      format.js {
        @phrase = AbcPhrase.create(
                                  user_id: session[:user_id],
                                  title: "new",
                                  meter: "4/4",
                                  length: "1/8",
                                  reference: "",
                                  key: "C",
                                  abc: "c"
                                  )
      }
    end
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

  # GET abc_phrases/tag_search
  def tag_search
    @phrase  = current_user.abc_phrases.build
    @phrases = AbcPhrase.where(user_id: current_user).joins(:tags).where("tags.id in (?) ", tag_params).order(updated_at: :desc).uniq
    @tags = SortedSet.new

		# TODO 本当はinner join×2 or ユーザーIDをDB定義に追加して取得したいが、時間がないので以下で回避
		phrases_all = AbcPhrase.where(user_id: current_user)
    phrases_all.each do |p|
      p.tags.each do |tag|
        @tags.add(tag)
      end
    end
    @tags.sort
  end

  private

  def abc_params
    params.require(:abc_phrase).permit(
			:title,
			:meter,
			:length,
			:reference,
			:key,
			:abc,
			:_destroy,
			tags_attributes: [:id, :name, :_destroy]
		)
  end

  def tag_params
		return nil if params[:abc_phrase].nil?
		params[:abc_phrase][:tag]
  end

end
