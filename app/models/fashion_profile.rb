class FashionProfile < ApplicationRecord
  belongs_to :user

  def self.latest_result(user)
    where(user: user).order(created_at: :desc).first
  end

  def result
    answers = [question1, question2, question3, question4, question5, question6].compact
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
  
  def description
    case result
    when "カジュアルスタイル"
      "シンプルで快適な服装が好まれ、リラックスした日常のコーディネートを楽しむ。"
    when "ストリートスタイル"
      "トレンドを意識したファッションで、個性的で目立つアイテムを取り入れるのが好き。"
    when "韓国系ファッション"
      "洗練されたデザインとミニマルなスタイルを好む。シンプルでありながらもトレンドを取り入れたコーディネート。"
    when "フォーマルスタイル"
      "クラシックでエレガントな服装を好み、場に応じたフォーマルなコーディネートを重視。"
    when "ガーリースタイル"
      "フェミニンで可愛らしいデザインを好む。女性らしさを引き立てるコーディネート。"
    when "スポーツミックススタイル"
      "スポーツウェアとカジュアルアイテムを組み合わせたスタイル。機能性とファッション性を兼ね備えたコーディネート。"
    when "ヴィンテージスタイル"
      "レトロで独特なデザインを好む。過去のファッションからインスパイアされたスタイル。"
    when "綺麗めスタイル"
      "洗練されていてエレガントなスタイル。シンプルでありながらも高級感のあるコーディネート。"
    end
  end
end