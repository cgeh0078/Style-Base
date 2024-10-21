class ColorDiagnosis < ApplicationRecord
  belongs_to :user

  # 診断結果を決定するメソッド
  def result
    spring_points = 0
    summer_points = 0
    autumn_points = 0
    winter_points = 0
  
    # 肌の色
    case skin_tone
    when 'A'
      spring_points += 1
      summer_points += 1
    when 'B'
      autumn_points += 1
    when 'C'
      winter_points += 1
    end
  
    # 目の色
    case eye_color
    when 'A'
      spring_points += 1
    when 'B'
      autumn_points += 1
    when 'C'
      winter_points += 1
    end
  
    # 髪の色
    case hair_color
    when 'A'
      spring_points += 1
      summer_points += 1
    when 'B'
      autumn_points += 1
    when 'C'
      winter_points += 1
    end
  
    # 日焼け反応
    case sunburn_reaction
    when 'A'
      summer_points += 1
    when 'B'
      spring_points += 1
    when 'C'
      autumn_points += 1
      winter_points += 1
    end
  
    # 色の好み
    case color_preference
    when 'A'
      spring_points += 1
      autumn_points += 1
    when 'B'
      summer_points += 1
      winter_points += 1
    end
  
    # アクセサリーの色
    case accessory_color
    when 'A'
      spring_points += 1
    when 'B'
      winter_points += 1
    end
  
    # 服の色
    case clothing_color
    when 'A'
      spring_points += 1
      autumn_points += 1
    when 'B'
      summer_points += 1
      winter_points += 1
    end
  
    # 最もポイントの高い結果を返す
    max_points = [spring_points, summer_points, autumn_points, winter_points].max
  
    if spring_points == max_points
      'イエベ春'
    elsif summer_points == max_points
      'ブルベ夏'
    elsif autumn_points == max_points
      'イエベ秋'
    elsif winter_points == max_points
      'ブルベ冬'
    else
      '診断結果が不明です'
    end
  end

  def personal_color_info
    case result
    when 'イエベ春'
      {
        description: '明るく、暖かみのあるカラーが特徴です。透明感があり、柔らかい印象を与えます。',
        fashion_advice: 'ピーチピンクやサーモンピンク、コーラルオレンジなどの暖かみのある色合いが似合います。軽やかで柔らかい素材の服を選びましょう。'
      }
    when 'ブルベ夏'
      {
        description: '涼しげで柔らかい色が特徴です。クールで上品な印象を持つ人が多いです。',
        fashion_advice: 'ラベンダーやパステルブルー、スモーキーグレーなどの涼しげな色合いが似合います。柔らかい素材やシンプルなデザインの服がオススメです。'
      }
    when 'イエベ秋'
      {
        description: '暖かく、深みのあるカラーが特徴です。落ち着いた印象を与える人が多いです。',
        fashion_advice: 'マスタードイエローやオリーブグリーン、ブラウンなど、アースカラーがよく似合います。しっかりとした素材や、重厚感のあるデザインが似合います。'
      }
    when 'ブルベ冬'
      {
        description: 'はっきりとした色が似合い、クールでシャープな印象です。',
        fashion_advice: 'クリアなホワイトやブラック、ブルーレッド、エメラルドグリーンなど、鮮やかなコントラストのある色が似合います。シャープでシンプルなデザインの服を選ぶと良いでしょう。'
      }
    else
      {
        description: '診断結果が不明です。',
        fashion_advice: '診断に基づいたアドバイスを提供できません。'
      }
    end
  end
end