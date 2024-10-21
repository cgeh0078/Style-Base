class UsersController < ApplicationController
  def show
    @user = current_user
    @fashion_profile = @user.fashion_profiles.order(created_at: :desc).first # 最新のファッションジャンル診断
    
    @body_diagnosis = @user.body_diagnoses.order(created_at: :desc).first # 最新の骨格診断
    
    @color_diagnosis = @user.color_diagnoses.order(created_at: :desc).first # 最新のパーソナルカラー診断
    if @color_diagnosis
        @color_info = @color_diagnosis.personal_color_info
      else
        @color_info = nil
      end
    end
    
    @body_info = get_body_info(@body_diagnosis.result) if @body_diagnosis
  end

  private
  def get_color_info(result)
  case result
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
  ColorInfo.find_by(color_type: result)
  end

  def get_body_info(result)
    case result
    when 'ウェーブ'
      {
        description: '柔らかいボディラインで、全体的に華奢な印象。体にフィットする服が似合います。',
        fashion_advice: '柔らかい素材や、体にフィットするデザインが似合います。ウエストマークが効いた服を選びましょう。',
        images:['wave1.png', 'wave3.png']
      }
    when 'ストレート'
      {
        description: 'メリハリのあるボディラインが特徴。シンプルで直線的なデザインの服が似合います。',
        fashion_advice: 'シンプルで直線的なデザインが得意です。ハリのある素材や、余計な装飾のない服が似合います。',
        images:['straight1.png', 'straight3.png']
      }
    when 'ナチュラル'
      {
        description: '骨格がしっかりしていて、カジュアルでラフなスタイルが得意です。',
        fashion_advice: 'ラフでリラックスしたスタイルが似合います。天然素材やゆったりとしたシルエットがベストです。',
        images:['natural1.png', 'natural3.png']
      }
    when 'ウェーブ×ナチュラル'
      {
        description: 'ウェーブの柔らかさとナチュラルのラフさを持ち合わせています。適度に体にフィットしつつ、自然な素材が似合います。',
        fashion_advice: '自然な素材感と、体に少しフィットするシルエットの服が良いです。カジュアルでありながら、フェミニンさも大切にしましょう。',
        images:['wave3.png', 'natural3.png']
      }
    when 'ウェーブ×ストレート'
      {
        description: 'フェミニンな柔らかさとストレートの直線的なラインが特徴。体にフィットする上品なスタイルが似合います。',
        fashion_advice: '上品でありながらも、女性らしいラインを取り入れたデザインが似合います。適度にフィットする服を選びましょう。',
        images:['wave3.png', 'straight3.png']
      }
    when 'ナチュラル✖️ウェーブ'
      {
        description: '自然な印象と女性らしい柔らかさが特徴。カジュアルな中に少しのフェミニンさを取り入れたスタイルが似合います。',
        fashion_advice:'フェミニンな要素を取り入れたカジュアルスタイルがおすすめです。ゆったりしつつも女性らしいディテールが重要です。',
        images:['wave3.png', 'natural3.png']        
      }
    when 'ストレート×ウェーブ'
      {
        description: 'ストレートのメリハリとウェーブの柔らかさを併せ持つスタイル。適度に体を強調する服が合います。',
        fashion_advice: '体にフィットするデザインとシンプルさを併せ持った服が似合います。ウエストを強調するスタイルがおすすめです。',
        images:['wave3.png', 'straight3.png']        
      }
    when 'ナチュラル×ストレート'
      {
        description: 'シンプルで骨格を強調するデザインが似合います。ラフなスタイルとクリーンなラインの服がベストです。',
        fashion_advice: 'シンプルかつラフで、骨格を強調するスタイルが合います。クリーンで無駄のないデザインを選びましょう。',
        images:['natural3.png', 'straight3.png']
      }
    when 'ストレート×ナチュラル'
      {
        description: 'シンプルさとカジュアルさが共存するスタイル。無駄のないデザインが魅力です。',
        fashion_advice: 'シンプルでラフなスタイルが似合います。直線的で無駄のないデザインが魅力です。',
        images:['natural3.png', 'straight3.png']
      }
    else 
      {
        description: '3タイプミックスの特徴を併せ持ちます。多様なスタイルが楽しめます。',
        fashion_advice: 'あなたのスタイルは多様な要素を含んでおり、色々なデザインを楽しむことができます。自分らしいスタイルを見つけてください。',
        images: ['wave3.png', 'straight3.png', 'natural3.png']
      }
    end
  end
end