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
    atelier_z: 0,
    aria: 1,
    aria_pro_ii: 2,
    bc_rich: 3,
    bacchus: 4,
    burny: 5,
    caparison: 6,
    carvin: 7,
    charvel: 8,
    collings: 9,
    cort: 10,
    crews_maniac_sound: 11,
    dingwall: 12,
    eastman: 13,
    edwards: 14,
    epiphone: 15,
    esp: 16,
    evh: 17,
    fender: 18,
    fender_cs: 19,
    fernandes: 20,
    fodera: 21,
    fujigen: 22,
    gl: 23,
    gibson: 24,
    gibson_cs: 25,
    godin: 26,
    greco: 27,
    gretsch: 28,
    guild: 29,
    ibanez: 30,
    jackson: 31,
    ken_smith: 32,
    kunaggs: 33,
    lakland: 34,
    martin: 35,
    maton: 36,
    mayones: 37,
    moon: 38,
    morris: 39,
    momose: 40,
    music_man: 41,
    ovation: 42,
    prs: 43,
    rickenbacker: 44,
    sadowsky: 45,
    sago: 46,
    saito_guitars: 47,
    schecter: 48,
    sire: 49,
    sonic: 50,
    squier: 51,
    steinberger: 52,
    suhr: 53,
    takamine: 54,
    taylor: 55,
    tokai: 56,
    vigier: 57,
    warwick: 58,
    washburn: 59,
    xotic: 60,
    yairi: 61,
    yamaha: 62,
    brand_other: 63
  }

  def self.ransackable_attributes(auth_object = nil)
    %w[brand category instrument_model]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user]
  end
end
