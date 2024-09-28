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
    'Atelier z': 'Atelier Z',
    'Aria': 'Aria',
    'Aria pro ii': 'Aria pro Ⅱ',
    'Bc rich': 'B.C. Rich',
    'Bacchus': 'Bacchus',
    'Burny': 'Burny',
    'Caparison': 'Caparison',
    'Carvin': 'Carvin',
    'Charvel': 'Charvel',
    'Collings': 'Collings',
    'Cort': 'Cort',
    'Crews maniac sound': 'Crews maniac sound',
    'Dingwall': 'Dingwall',
    'Eastman': 'Eastman',
    'Edwards': 'Edwards',
    'Epiphone': 'Epiphone',
    'Esp': 'Esp',
    'Evh': 'Evh',
    'Fender': 'Fender',
    'Fender custom shop': 'Fender Custom shop',
    'Fernandes': 'Fernandes',
    'Fodera': 'Fodera',
    'Fujigen': 'Fujigen',
    'Gl': 'Gl',
    'Gibson': 'Gibson',
    'Gibson custom': 'Gibson Custom',
    'Godin': 'Godin',
    'Greco': 'Greco',
    'Gretsch': 'Gretsch',
    'Guild': 'Guild',
    'Ibanez': 'Ibanez',
    'Jackson': 'Jackson',
    'Ken smith': 'Ken Smith',
    'Kunaggs': 'Kunaggs',
    'Lakland': 'Lakland',
    'Martin': 'Martin',
    'Maton': 'Maton',
    'Mayones': 'Mayones',
    'Moon': 'Moon',
    'Morris': 'Morris',
    'Momose': 'Momose',
    'Music man': 'Music Man',
    'Ovation': 'Ovation',
    'Prs': 'PRS',
    'Rickenbacker': 'Rickenbacker',
    'Sadowsky': 'Sadowsky',
    'Sago': 'Sago',
    'Saito guitars': 'Saito Guitars',
    'Schecter': 'Schecter',
    'Sire': 'Sire',
    'Sonic': 'Sonic',
    'Squier': 'Squier',
    'Steinberger': 'Steinberger',
    'Suhr': 'Suhr',
    'Takamine': 'Takamine',
    'Taylor': 'Taylor',
    'Tokai': 'Tokai',
    'Vigier': 'Vigier',
    'Warwick': 'Warwick',
    'Washburn': 'Washburn',
    'Xotic': 'Xotic',
    'Yairi': 'Yairi',
    'Yamaha': 'Yamaha',
    'その他 ギター': 'その他 ギター',
    
    # ampメーカー
    'Marshall': 'Marshall',
    'Vox': 'Vox',
    'Mesa boogie': 'Mesa Boogie',
    'Orange': 'Orange',
    'Diezel': 'Diezel',
    'Soldano amp': 'Soldano Amp',
    'Synergy amps': 'Synergy Amps',
    'Bad cat': 'Bad Cat',
    'Bogner': 'Bogner',
    'Morgan amp': 'Morgan Amp',
    'Friedman': 'Friedman',
    'Matchless amp': 'Matchless Amp',
    'Two rock': 'Two Rock',
    'Victory amp': 'Victory Amp',
    'Carr amp': 'Carr Amp',
    'Dr z amp': 'Dr. Z Amp',
    'Tone king': 'Tone King',
    'Supro': 'Supro',
    'Blackstar amp': 'Blackstar Amp',
    'Engl': 'Engl',
    'Hughes and kettner': 'Hughes & Kettner',
    'Peavey': 'Peavey',
    'Revv amp': 'Revv Amp',
    'Positive grid': 'Positive Grid',
    'その他アンプメーカー': 'その他アンプメーカー',
    
    # effectorメーカー
    'Boss': 'Boss',
    'Line 6': 'Line 6',
    'Tc electronic': 'TC Electronic',
    'Strymon': 'Strymon',
    'Electro harmonix': 'Electro-Harmonix',
    'Mxr': 'MXR',
    'Dunlop': 'Dunlop',
    'Eventide': 'Eventide',
    'Wampler pedals': 'Wampler Pedals',
    'Jhs pedals': 'JHS Pedals',
    'Walrus audio': 'Walrus Audio',
    'Earthquaker devices': 'EarthQuaker Devices',
    'Chase bliss audio': 'Chase Bliss Audio',
    'Meris': 'Meris',
    'Source audio': 'Source Audio',
    'Keeley electronics': 'Keeley Electronics',
    'Way huge': 'Way Huge',
    'Fulltone': 'Fulltone',
    'Xotic effects': 'Xotic Effects',
    'Zvex effects': 'Zvex Effects',
    'Analogman': 'Analogman',
    'Catalinbread': 'Catalinbread',
    'Death by audio': 'Death By Audio',
    'Digitech': 'DigiTech',
    'Empress effects': 'Empress Effects',
    'Gamechanger audio': 'Gamechanger Audio',
    'Hologram electronics': 'Hologram Electronics',
    'Klon': 'Klon',
    'Old blood noise endeavors': 'Old Blood Noise Endeavors',
    'Red panda': 'Red Panda',
    'Spaceman effects': 'Spaceman Effects',
    'Thorpy fx': 'Thorpy FX',
    'Universal audio': 'Universal Audio',
    'その他 エフェクター': 'その他 エフェクター'
  }

  def self.ransackable_attributes(auth_object = nil)
    %w[brand category instrument_model]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user]
  end
end
