class BodyDiagnosis < ApplicationRecord
    # バリデーションの例（必要に応じて追加）
    validates :shoulder_line, presence: true
    validates :waist_line, presence: true
    validates :hip_line, presence: true
    validates :leg_length, presence: true

    belongs_to :user
  
    # 診断結果を決定するメソッド
    def result
      case
      when shoulder_line == 'A' && waist_line == 'A' && hip_line == 'A'
        "ストレート"
      when shoulder_line == 'B' && waist_line == 'B' && hip_line == 'B'
        "ナチュラル"
      else
        "ウェーブ"
      end
    end
end