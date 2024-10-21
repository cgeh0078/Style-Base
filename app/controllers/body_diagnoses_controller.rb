class BodyDiagnosesController < ApplicationController
  def new
    @body_diagnosis = BodyDiagnosis.new
  end

  def create
    @body_diagnosis = current_user.body_diagnoses.build(body_diagnosis_params)
    if @body_diagnosis.save
      redirect_to @body_diagnosis, notice: 'Body diagnosis was successfully created.'
    else
      render :new
    end
  end
  
  def show
    @body_diagnosis = BodyDiagnosis.find(params[:id])
    @result = calculate_result(@body_diagnosis)  # 診断結果の計算
    @result = current_user.body_diagnoses.last.result
    @styles = {
      'ウェーブ' => 'wave-style',
      'ストレート' => 'straight-style',
      'ナチュラル' => 'natural-style',
      'ウェーブ×ナチュラル' => 'wave-natural-style',
      'ストレート×ウェーブ' => 'straight-wave-style',
      'ストレート×ナチュラル' => 'straight-natural-style',
      'ナチュラル×ウェーブ' => 'natural-wave-style',
      'ナチュラル×ストレート' => 'natural-straight-style',
      'ウェーブ×ストレート' => 'wave-straight-style',
      '3タイプミックス' => 'three-mix-style'
    }

    @style_class = @styles[@result] || 'unknown-style'
  end

  private

  # パラメーターの許可
  def body_diagnosis_params
    params.require(:body_diagnosis).permit(:shoulder_line, :waist_line, :hip_line, :leg_length)
  end

  # 診断結果の計算
  def calculate_result(body_diagnosis)
    # 肩のライン、腰のライン、ヒップのライン、足の長さに基づいた診断ロジック
    case [body_diagnosis.shoulder_line, body_diagnosis.waist_line, body_diagnosis.hip_line, body_diagnosis.leg_length]
    # 生粋のウェーブ・ストレート・ナチュラル
      when ['A', 'A', 'A', 'A']
        'ウェーブ'
      when ['B', 'B', 'B', 'B']
        'ストレート'
      when ['C', 'C', 'C', 'C']
        'ナチュラル'
      when ['A', 'A', 'A', 'B']
        'ウェーブ'
      when ['A', 'A', 'A', 'C']
        'ウェーブ'
      when ['A', 'A', 'B', 'B']
        'ウェーブ×ストレート'
      when ['A', 'A', 'B', 'C']
        '3タイプミックス'
      when ['A', 'A', 'C', 'C']
        'ウェーブ×ナチュラル'
      when ['A', 'B', 'B', 'B']
        'ストレート'
      when ['A', 'B', 'B', 'C']
        '3タイプミックス'
      when ['A', 'B', 'C', 'C']
        '3タイプミックス'
      when ['A', 'C', 'C', 'C']
        'ナチュラル'
      when ['B', 'B', 'B', 'A']
        'ストレート'
      when ['B', 'B', 'B', 'C']
        'ストレート'
      when ['B', 'B', 'A', 'A']
        'ストレート×ウェーブ'
      when ['B', 'B', 'A', 'C']
        '3タイプミックス'
      when ['B', 'B', 'C', 'C']
        'ストレート×ナチュラル'
      when ['B', 'A', 'A', 'A']
        'ウェーブ'
      when ['B', 'A', 'A', 'C']
        '3タイプミックス'
      when ['B', 'A', 'C', 'C']
        '3タイプミックス'
      when ['B', 'C', 'C', 'C']
        'ナチュラル'
      when ['C', 'C', 'C', 'A']
        'ナチュラル'
      when ['C', 'C', 'C', 'B']
        'ナチュラル'
      when ['C', 'C', 'A', 'A']
        'ナチュラル×ウェーブ'
      when ['C', 'C', 'A', 'B']
        '3タイプミックス'
      when ['C', 'C', 'B', 'B']
        'ナチュラル×ストレート'
      when ['C', 'A', 'A', 'A']
        'ウェーブ'
      when ['C', 'A', 'A', 'B']
        '3タイプミックス'
      when ['C', 'A', 'B', 'B']
        '3タイプミックス'
      when ['C', 'B', 'B', 'B']
        'ストレート'
      when ['B', 'A', 'B', 'B']
        'ストレート'
      when ['A', 'B', 'A', 'A']
        'ウェーブ'
      when ['C', 'B', 'A', 'C']
        '3タイプミックス'
      when ['B', 'C', 'A', 'C']
        '3タイプミックス'
      when ['A', 'B', 'C', 'B']
        '3タイプミックス'
      when ['B', 'A', 'C', 'A']
        '3タイプミックス'
      when ['A', 'C', 'A', 'B']
        '3タイプミックス'
      else
        '3タイプミックス'
      end
  end
end