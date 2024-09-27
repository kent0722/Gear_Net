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
  'Atelier Z': 0,
  Aria: 1,
  'Aria pro Ⅱ': 2,
  'B.C. Rich': 3,
  Bacchus: 4,
  Burny: 5,
  Caparison: 6,
  Carvin: 7,
  Charvel: 8,
  Collings: 9,
  Cort: 10,
  'Crews maniac sound': 11,
  Dingwall: 12,
  Eastman: 13,
  Edwards: 14,
  Epiphone: 15,
  Esp: 16,
  Evh: 17,
  Fender: 18,
  'Fender Custom shop': 19,
  Fernandes: 20,
  Fodera: 21,
  Fujigen: 22,
  Gl: 23,
  Gibson: 24,
  'Gibson Custom': 25,
  Godin: 26,
  Greco: 27,
  Gretsch: 28,
  Guild: 29,
  Ibanez: 30,
  Jackson: 31,
  'Ken Smith': 32,
  Kunaggs: 33,
  Lakland: 34,
  Martin: 35,
  Maton: 36,
  Mayones: 37,
  Moon: 38,
  Morris: 39,
  Momose: 40,
  'Music Man': 41,
  Ovation: 42,
  PRS: 43,
  Rickenbacker: 44,
  Sadowsky: 45,
  Sago: 46,
  'Saito Guitars': 47,
  Schecter: 48,
  Sire: 49,
  Sonic: 50,
  Squier: 51,
  Steinberger: 52,
  Suhr: 53,
  Takamine: 54,
  Taylor: 55,
  Tokai: 56,
  Vigier: 57,
  Warwick: 58,
  Washburn: 59,
  Xotic: 60,
  Yairi: 61,
  Yamaha: 62,
  'その他 ギター': 63,
  # amp メーカー
  Marshall: 64,
  Vox: 65,
  'Mesa Boogie': 66,
  Orange: 67,
  Diezel: 68,
  'Soldano Amp': 69,
  'Synergy Amps': 70,
  'Bad Cat': 71,
  Bogner: 72,
  'Morgan Amp': 73,
  Friedman: 74,
  'Matchless Amp': 75,
  'Two Rock': 76,
  'Victory Amp': 77,
  'Carr Amp': 78,
  'Dr. Z Amp': 79,
  'Tone King': 80,
  'Supro': 81,
  'Blackstar Amp': 82,
  'Engl': 83,
  'Hughes & Kettner': 84,
  'Peavey': 85,
  'Revv Amp': 86,
  'その他アンプ': 87,
  # effector メーカー
  Boss: 87,
  'Line 6': 88,
  'TC Electronic': 89,
  Strymon: 90,
  'Electro-Harmonix': 91,
  MXR: 92,
  Dunlop: 93,
  Eventide: 94,
  'Wampler Pedals': 95,
  'JHS Pedals': 96,
  'Walrus Audio': 97,
  'EarthQuaker Devices': 98,
  'Chase Bliss Audio': 99,
  'Meris': 100,
  'Source Audio': 101,
  'Keeley Electronics': 102,
  'Way Huge': 103,
  'Fulltone': 104,
  'Xotic Effects': 105,
  'Zvex Effects': 106,
  'Analogman': 107,
  'Catalinbread': 108,
  'Death By Audio': 109,
  'DigiTech': 110,
  'Empress Effects': 111,
  'Gamechanger Audio': 112,
  'Hologram Electronics': 113,
  'Klon': 114,
  'Old Blood Noise Endeavors': 115,
  'Red Panda': 116,
  'Spaceman Effects': 117,
  'Thorpy FX': 118,
  'Universal Audio': 119,
  'その他 エフェクター': 120
}

  def self.ransackable_attributes(auth_object = nil)
    %w[brand category instrument_model]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user]
  end
end
