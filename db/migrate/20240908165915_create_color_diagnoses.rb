class CreateColorDiagnoses < ActiveRecord::Migration[6.1]
  def change
    create_table :color_diagnoses do |t|
      t.string :skin_tone       # 肌の色
      t.string :eye_color        # 目の色
      t.string :hair_color       # 髪の色
      t.string :sunburn_reaction # 日焼け反応
      t.string :color_preference # 色の好み
      t.string :accessory_color  # アクセサリーの色
      t.string :clothing_color   # 服の色
      t.string :result           # 診断結果

      t.timestamps
    end
  end
end