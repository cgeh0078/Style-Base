class ColorDiagnosesController < ApplicationController

  def index
    @color_diagnoses = ColorDiagnosis.all
  end

  def new
    @color_diagnosis = ColorDiagnosis.new
  end

  def create
    @color_diagnosis = ColorDiagnosis.new(color_diagnosis_params)
    @color_diagnosis.user = current_user  # current_userがログイン中のユーザーであることを確認
    
    if @color_diagnosis.save
      @result = @color_diagnosis.result
      @color_info = @color_diagnosis.personal_color_info
      redirect_to color_diagnosis_path(@color_diagnosis)
    else
      flash[:alert] = @color_diagnosis.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @color_diagnosis = ColorDiagnosis.find(params[:id])
    @result = @color_diagnosis.result

    Rails.logger.debug(@result) # 診断結果を確認するためのデバッグ
  
    # 診断結果に基づいて対応する情報を設定
    @color_info = case @result
                  when 'イエベ春'
                    {
                      description: 'イエベ春は、明るく暖かみのある色が似合います。',
                      fashion_advice: 'パステルカラーやアイボリー、クリーム色の服が似合います。'
                    }
                  when 'ブルベ夏'
                    {
                      description: 'ブルベ夏は、ソフトで落ち着いた色が似合います。涼しげでエレガントな印象',
                      fashion_advice: 'ラベンダーやミントグリーン、ピンクの服が似合います。'
                    }
                  when 'イエベ秋'
                    {
                      description: 'イエベ秋は、深みのある暖かい色が似合います。',
                      fashion_advice: 'カーキやブラウン、オリーブグリーンの服が似合います。'
                    }
                  when 'ブルベ冬'
                    {
                      description: 'ブルベ冬は、コントラストの強い色が似合います。クールでシャープな印象',
                      fashion_advice: '黒や白、ネイビー、深い赤の服が似合います。'
                    }
                  else
                    {
                      description: '特徴が不明です。',
                      fashion_advice: 'アドバイスがありません。'
                    }
                  end
  end
  private

  def color_diagnosis_params
    params.require(:color_diagnosis).permit(:skin_tone, :eye_color, :hair_color, :sunburn_reaction, :color_preference, :accessory_color, :clothing_color)
  end
end