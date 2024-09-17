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
      title: 'GearNET.',
      reverse: true,
      charset: 'utf-8',
      description: '',
      keywords: '楽器,音楽,コミュニティ',
      canonical: request.original_url,
      separator: '|',
      og:{
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('haikei3.jpg'),
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@',
        image: image_url('haikei3.jpg')
      }
    }
  end
end
