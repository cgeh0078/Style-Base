class FashionProfilesController < ApplicationController
  def new
    @fashion_profile = FashionProfile.new
  end

  def create
    @fashion_profile = current_user.fashion_profiles.build(fashion_profile_params)
    @fashion_profile.user = current_user
    if @fashion_profile.save
      redirect_to @fashion_profile, notice: 'Fashion profile was successfully created.'
    else
      render :new
    end
  end

  def show
    @fashion_profile = FashionProfile.find(params[:id])
    @result = @fashion_profile.result
  end

  def result
    # ここで質問の回答を結合して結果を決定するロジックを実装します
    answers = [question1, question2, question3, question4, question5].compact
    if answers.include?("A")
      "カジュアルスタイル"
    elsif answers.include?("B")
      "ストリートスタイル"
    elsif answers.include?("C")
      "韓国系ファッション"
    elsif answers.include?("D")
      "フォーマルスタイル"
    elsif answers.include?("E")
      "ガーリースタイル"
    elsif answers.include?("F")
      "スポーツミックススタイル"
    elsif answers.include?("G")
      "ヴィンテージスタイル"
    elsif answers.include?("H")
      "綺麗めスタイル"
    else
      "その他"
    end
  end

  private

  def fashion_profile_params
    params.require(:fashion_profile).permit(:question1, :question2, :question3, :question4, :question5, :question6)
  end
end



