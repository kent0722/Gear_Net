class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many_attached :images
  acts_as_taggable_on :tags

  validates :brand, presence: true
  validates :category, presence: true, length: { maximum: 15 }
  validates :production_year, numericality: { only_integer: true }, allow_blank: true
  validates :instrument_model, length: { maximum: 25 }
  validates :body, length: { maximum: 100 }

  enum production_year: (1950..2025).map { |year| [year.to_s, year] }.to_h
  enum brand: {
    # guitar/bassメーカー
    'atelier z': 'Atelier Z',
    'aria': 'Aria',
    'aria pro ii': 'Aria pro Ⅱ',
    'bc rich': 'B.C. Rich',
    'bacchus': 'Bacchus',
    'burny': 'Burny',
    'caparison': 'Caparison',
    'carvin': 'Carvin',
    'charvel': 'Charvel',
    'collings': 'Collings',
    'cort': 'Cort',
    'crews maniac sound': 'Crews maniac sound',
    'dingwall': 'Dingwall',
    'eastman': 'Eastman',
    'edwards': 'Edwards',
    'epiphone': 'Epiphone',
    'esp': 'Esp',
    'evh': 'Evh',
    'fender': 'Fender',
    'fender custom shop': 'Fender Custom shop',
    'fernandes': 'Fernandes',
    'fodera': 'Fodera',
    'fujigen': 'Fujigen',
    'gl': 'Gl',
    'gibson': 'Gibson',
    'gibson custom': 'Gibson Custom',
    'godin': 'Godin',
    'greco': 'Greco',
    'gretsch': 'Gretsch',
    'guild': 'Guild',
    'ibanez': 'Ibanez',
    'jackson': 'Jackson',
    'ken smith': 'Ken Smith',
    'kunaggs': 'Kunaggs',
    'lakland': 'Lakland',
    'martin': 'Martin',
    'maton': 'Maton',
    'mayones': 'Mayones',
    'moon': 'Moon',
    'morris': 'Morris',
    'momose': 'Momose',
    'music man': 'Music Man',
    'ovation': 'Ovation',
    'prs': 'PRS',
    'rickenbacker': 'Rickenbacker',
    'sadowsky': 'Sadowsky',
    'sago': 'Sago',
    'saito guitars': 'Saito Guitars',
    'schecter': 'Schecter',
    'sire': 'Sire',
    'sonic': 'Sonic',
    'squier': 'Squier',
    'steinberger': 'Steinberger',
    'suhr': 'Suhr',
    'takamine': 'Takamine',
    'taylor': 'Taylor',
    'tokai': 'Tokai',
    'vigier': 'Vigier',
    'warwick': 'Warwick',
    'washburn': 'Washburn',
    'xotic': 'Xotic',
    'yairi': 'Yairi',
    'yamaha': 'Yamaha',
    'other guitar': 'その他 ギター',
    
    # ampメーカー
    'marshall': 'Marshall',
    'vox': 'Vox',
    'mesa boogie': 'Mesa Boogie',
    'orange': 'Orange',
    'diezel': 'Diezel',
    'soldano amp': 'Soldano Amp',
    'synergy amps': 'Synergy Amps',
    'bad cat': 'Bad Cat',
    'bogner': 'Bogner',
    'morgan amp': 'Morgan Amp',
    'friedman': 'Friedman',
    'matchless amp': 'Matchless Amp',
    'two rock': 'Two Rock',
    'victory amp': 'Victory Amp',
    'carr amp': 'Carr Amp',
    'dr z amp': 'Dr. Z Amp',
    'tone king': 'Tone King',
    'supro': 'Supro',
    'blackstar amp': 'Blackstar Amp',
    'engl': 'Engl',
    'hughes and kettner': 'Hughes & Kettner',
    'peavey': 'Peavey',
    'revv amp': 'Revv Amp',
    'positive grid': 'Positive Grid',
    'other amp maker': 'その他アンプメーカー',
    
    # effectorメーカー
    'boss': 'Boss',
    'line 6': 'Line 6',
    'tc electronic': 'TC Electronic',
    'strymon': 'Strymon',
    'electro harmonix': 'Electro-Harmonix',
    'mxr': 'MXR',
    'dunlop': 'Dunlop',
    'eventide': 'Eventide',
    'wampler pedals': 'Wampler Pedals',
    'jhs pedals': 'JHS Pedals',
    'walrus audio': 'Walrus Audio',
    'earthquaker devices': 'EarthQuaker Devices',
    'chase bliss audio': 'Chase Bliss Audio',
    'meris': 'Meris',
    'source audio': 'Source Audio',
    'keeley electronics': 'Keeley Electronics',
    'way huge': 'Way Huge',
    'fulltone': 'Fulltone',
    'xotic effects': 'Xotic Effects',
    'zvex effects': 'Zvex Effects',
    'analogman': 'Analogman',
    'catalinbread': 'Catalinbread',
    'death by audio': 'Death By Audio',
    'digitech': 'DigiTech',
    'empress effects': 'Empress Effects',
    'gamechanger audio': 'Gamechanger Audio',
    'hologram electronics': 'Hologram Electronics',
    'klon': 'Klon',
    'old blood noise endeavors': 'Old Blood Noise Endeavors',
    'red panda': 'Red Panda',
    'spaceman effects': 'Spaceman Effects',
    'thorpy fx': 'Thorpy FX',
    'universal audio': 'Universal Audio',
    'other effector': 'その他 エフェクター'
  }

  def self.ransackable_attributes(auth_object = nil)
    %w[brand category instrument_model]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user]
  end
end
