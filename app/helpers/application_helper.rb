module ApplicationHelper
  def flash_background_color(type)
    case type.to_sym
    when :notice then "bg-green-500"
    when :success then "bg-blue-500"
    when :danger  then "bg-red-500"
    when :error  then "bg-yellow-500"
    else "bg-gray-500"
    end
  end

  def default_meta_tags
    {
      site: 'GearNET.',
      title: '楽器好きのためのコミュニティツール',
      reverse: true,
      charset: 'utf-8',
      description: 'GearNET.は、ギターやベースなどの楽器を愛する人々のためのコミュニティーツールです。楽器の紹介、情報交換、仲間作りができます。',
      keywords: '',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('haikei3.jpg') },
        { href: image_url('top_image.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('haikei3.jpg'),# 配置するパスやファイル名によって変更する
        local: 'ja-JP',
      },
      twitter: {
        card: 'summary_large_image', # Twitterで表示する場合は大きいカードに変更
        site: '@あなたのツイッターアカウント', # アプリの公式Twitterアカウントがあれば、アカウント名を記載
        image: image_url('haikei3.jpg'),# 配置するパスやファイル名によって変更
      }
    }
  end
end
