class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image, dependent: :destroy

  validates :brand, presence: true, length: { maximum: 20 }
  validates :category, presence: true, length: { maximum: 20 }
  validates :production_year, numericality: { only_integer: true }, allow_blank: true
  validates :instrument_model, length: { maximum: 25 }
  validates :body, length: { maximum: 100 }

  enum production_year: (1950..2024).map { |year| [year.to_s, year] }.to_h
  enum brand: {
  'ATELIER Z': 'atelier_z',
  'Aria': 'aria',
  'Aria Pro II': 'aria_pro_ii',
  'B.C. Rich': 'bc_rich',
  'Bacchus': 'bacchus',
  'Burny': 'burny',
  'Caparison': 'caparison',
  'Carvin': 'carvin',
  'Charvel': 'charvel',
  'Collings': 'collings',
  'Cort': 'cort',
  'Crews Maniac Sound': 'crews_maniac_sound',
  'Dingwall': 'dingwall',
  'Eastman': 'eastman',
  'Edwards': 'edwards',
  'Epiphone': 'epiphone',
  'ESP': 'esp',
  'EVH': 'evh',
  'Fender': 'fender',
  'Fender Custom Shop': 'fender_custom_shop',
  'Fernandes': 'fernandes',
  'Fodera': 'fodera',
  'Fujigen': 'fujigen',
  'G&L': 'gl',
  'Gibson': 'gibson',
  'Gibson Custom': 'gibson_custom',
  'Godin': 'godin',
  'Greco': 'greco',
  'Gretsch': 'gretsch',
  'Guild': 'guild',
  'Ibanez': 'ibanez',
  'Jackson': 'jackson',
  'Ken Smith': 'ken_smith',
  'Kunaggs': 'Kunaggs',
  'Lakland': 'lakland',
  'Martin': 'martin',
  'Maton': 'maton',
  'Mayones': 'mayones',
  'Moon ': 'moon',
  'Morris': 'morris',
  'Momose': 'momose',
  'Music Man': 'music_man',
  'Ovation': 'ovation',
  'PRS (Paul Reed Smith)': 'prs',
  'Rickenbacker': 'rickenbacker',
  'Sadowsky': 'sadowsky',
  'Sago': 'sago',
  'Saito Guitars': 'saito_guitars',
  'Schecter': 'schecter',
  'Sire': 'sire',
  'Sonic': 'sonic',
  'Squier': 'squier',
  'Steinberger': 'steinberger',
  'Suhr': 'suhr',
  'Takamine': 'takamine',
  'Taylor': 'taylor',
  'Tokai': 'tokai',
  'Vigier': 'vigier',
  'Warwick': 'warwick',
  'Washburn': 'washburn',
  'Xotic': 'xotic',
  'Yairi': 'yairi',
  'Yamaha': 'yamaha',
  'その他': 'brand_other'
  }
end