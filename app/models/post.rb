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
  Atelier_z: 0,
  Aria: 1,
  Aria_pro_ii: 2,
  Bc_rich: 3,
  Bacchus: 4,
  Burny: 5,
  Caparison: 6,
  Carvin: 7,
  Charvel: 8,
  Collings: 9,
  Cort: 10,
  Crews_maniac_sound: 11,
  Dingwall: 12,
  Eastman: 13,
  Edwards: 14,
  Epiphone: 15,
  Esp: 16,
  Evh: 17,
  Fender: 18,
  Fender_cs: 19,
  Fernandes: 20,
  Fodera: 21,
  Fujigen: 22,
  Gl: 23,
  Gibson: 24,
  Gibson_cs: 25,
  Godin: 26,
  Greco: 27,
  Gretsch: 28,
  Guild: 29,
  Ibanez: 30,
  Jackson: 31,
  Ken_smith: 32,
  Kunaggs: 33,
  Lakland: 34,
  Martin: 35,
  Maton: 36,
  Mayones: 37,
  Moon: 38,
  Morris: 39,
  Momose: 40,
  Music_man: 41,
  Ovation: 42,
  Prs: 43,
  Rickenbacker: 44,
  Sadowsky: 45,
  Sago: 46,
  Saito_guitars: 47,
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
  Brand_other: 63
}

  def self.ransackable_attributes(auth_object = nil)
    %w[brand category instrument_model]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user]
  end
end
