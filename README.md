# README

■ サービス概要
  自身のギターやベース、エフェクターなどを紹介し、情報共有を目的とするコミュニティーツールです。
  (サービス名（仮） ・ギタコレ!! ・ギアシェア ・GearNET  ...etc)

■ このサービスへの思い・作りたい理由
   私自身ギターやベースといった楽器が大好きで、日々演奏を楽しんでいます。
   そこで同じ楽器好きの仲間と交流し、情報を共有する場があればとても楽しいのではないかと思いました。
   このサービスは、そんな楽器好きの人たちが集まって気軽にお互いの楽器を紹介し合い、機材の情報交換をする場を提供したいと思っています。

   さらに、このコミュニティを通じて、新しい知り合いや友達を作り、一緒にバンドを結成する機会を得ることもできればと考えています。
   また自身のYouTubeチャンネルや Xアカウントを紹介することで、音楽活動を広める場にもなればと思っています。

  「ギタコレ！！」は、そんな楽器好きが集まり、情報を共有し、交流を深め、新たな音楽仲間と出会うためのアプリにしたいと思っています。


■ ユーザー層について
  学生
    ・対象: 楽器に興味を持ち、学校の音楽活動や自主的な練習を行っている方。
    ・理由: ・バンド活動や音楽クラブに参加している。
           ・音楽の情報を知りたい。
           ・新しい仲間作り。
           ・技術を磨きたい。

  社会人 
    ・対象: 仕事をしながら音楽が趣味な方。
    ・理由: ・趣味として音楽を楽しみたい。
           ・音楽の情報を知りたい。
           ・新しい仲間作り。
           ・技術を磨きたい。
           

■ サービスの利用イメージ
  利用方法
     ・ユーザー登録を行う。
     ・プロフィールページの設定。
     ・自分の楽器（ギター、ベースなど）や機材（エフェクターなど）の画像や動画、レビュー書きを投稿する。(投稿したい人のみ設定)
     ・他のユーザーの投稿を閲覧し、いいねやお気に入り、コメントを書く。
     ・フォーラムやチャット機能を使って、他のユーザーと情報交換を行う。
   
  価値
     ・楽器や機材の情報共有ができる :他のユーザーが持っている楽器や機材に関する情報やレビューから知識を深めることができる
     ・同じ趣味をもつ仲間ができる :楽器や音楽に対する共通の趣味を持つ仲間ができることでモチベーションがあがる
     ・技術や演奏スキルの向上 :他ユーザーの演奏動画を参考にしたり、またアドバイスを受けたりすることで自分の技術やスキル向上につながる


■ ユーザーの獲得について
  投稿を簡単に行えるシェアボタンを設置やQRコードを使用したいと思っています。

■ サービスの差別化ポイント・推しポイント
  類似サービス
    ・BandLab : 音楽制作に焦点を当てていて他のミュージシャンとつながり、作品の公開や情報交換が行われています。
    ・Vampr :  音楽制作に焦点を当てており、よりプロ思考を対象としている印象。
    ・Co-Writing Studio : 音楽制作のコミュニケーションツール。仲間同士でやり取りをする便利ツールといった印象。
   
  当サービスの差別化ポイント
    ・音楽好きならプロ・アマ問わず誰でも気軽に利用できる。
    ・楽曲制作に重点を置いた他のアプリとは異なり、楽器や機材の紹介から始められるので初心者や趣味で楽器を楽しむ人にとっても使いやすい。
    ・音楽仲間との出会いや、互いの活動の共有、バンドの結成につながることを期待できる。



■ 機能候補
  MVPリリース
    ・ユーザー登録・ログイン機能
    ・タグ機能（楽器の種類を選択）
    ・プロフィール機能(Xとyoutubeのアカウントを載せることできる)
    ・コンテンツ投稿機能(紹介したい楽器の画像や動画の投稿)
    ・いいね
    ・お気に入り
    ・フォロー機能
    ・コメント機能
    ・マイページ機能 
    
  本リリース(仮)
    ・DM機能
    ・ランキング機能
    ・お知らせ機能
    ・検索機能  ※マルチ検索・オートコンプリート 



■ 機能の実装方針予定
  ・自身のギター、ベース、エフェクターなどの機材の画像、演奏動画を紹介しいいね、お気に入り、コメントができる機能。
  ・SNSのようなチャット機能でリアルタイムでやり取りができる機能。
  ・お気に入りのユーザーをフォローし、フォローしたユーザーがあたらしい写真、動画を更新した時のお知らせ機能。お知らせ方法はメールかプッシュ機能、ライン等で検討中。
  ・登録時に、関連するメーカーやタグを設定しその情報を元に検索ができる機能。 ※マルチ検索・オートコンプリート
  ・ユーザー登録はgoogleアカウントで簡単に登録できるように実装していたい。
  ・プロフィールでXとyoutubeのアカウントを載せることできる。
  
フレームワーム
  ・Rails 7
Gem
  ・Sorcery: ログイン機能の実装（基本的な機能のみで良いと思うのでDeviseではなくSorceryを使用予定）
  ・omniauth-google-oauth2: google認証でログインができる
  ・acts_as_follower: フォロー機能の実装
  ・ransack: 検索機能
  ・stimulus-autocomplete: 検索補完機能の実装予定
  ・carrierwave: 画像、動画にアップロード
  ・image_processing: 画像のリサイズ
  ・streamio-ffmpeg: 動画の長さ、ファイルサイズの検証および変換
  ・kaminari: ページネーションの実装
  ・acts-as-taggable-on: タグ機能(使用するかは検討中)
  ・pundit: 権限管理

API
  ・DM機能：ActionCableを使用して実装予定。
  ・Notification: フォローしたユーザーの新規投稿、新規フォロー、メッセージなどの通知
フロントの技術
  ・React
  ・tailwind CSS
デプロイサービス
  ・Heroku


■ 投稿内容について
  ・ギター、アコギ、ベース、エフェクター、その他(その他の場合は手入力)で選択したものによって投稿フォーム出るように実装と選択したものでタグがつくように実装(ギター:赤、アコギ:オレンジ、ベース:青、エフェクター:紫、その他:グレー)
      ギター、アコギ、ベース 
        ・ブランド名・カテゴリー(stratcaster, telecaster, lesporlなど)・年代を選択ボックスから選択。モデル名(手入力)。 該当しない場合はその他で手入力できるようにする。
        ・画像、動画のアップロード
        ・コメント
        ・プレビュー
      エフェクター
        ・機材メーカー、種類を選択（歪系、モジュレーション系、空間系、ダイナミクス系、フィルター系などタブから選択）、モデル名(手入力)
        ・画像、動画のアップロード
        ・コメント
        ・プレビュー
      その他
        ・メーカー名、種類を手入力
        ・画像、動画のアップロード
        ・コメント
        ・プレビュー

■ 画面遷移図
figma:[text](https://www.figma.com/design/otAy1mzefGG2xHZME0yxub/My_app_dev?node-id=0-1&t=7x1XMhkDci4FUDJo-1)RE

■ ER図
draw.io:[text](https://drive.google.com/file/d/1WmjND-yhE_E6vsLMml6eReQ2jVsVat8C/view?usp=sharing)