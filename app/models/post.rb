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
    atelier_z: 'Atelier Z',
    aria: 'Aria',
    aria_pro_ii: 'Aria pro Ⅱ',
    bc_rich: 'B.C. Rich',
    bacchus: 'Bacchus',
    burny: 'Burny',
    caparison: 'Caparison',
    carvin: 'Carvin',
    charvel: 'Charvel',
    collings: 'Collings',
    cort: 'Cort',
    crews_maniac_sound: 'Crews maniac sound',
    dingwall: 'Dingwall',
    eastman: 'Eastman',
    edwards: 'Edwards',
    epiphone: 'Epiphone',
    esp: 'Esp',
    evh: 'Evh',
    fender: 'Fender',
    fender_custom_shop: 'Fender Custom shop',
    fernandes: 'Fernandes',
    fodera: 'Fodera',
    fujigen: 'Fujigen',
    gl: 'Gl',
    gibson: 'Gibson',
    gibson_custom: 'Gibson Custom',
    godin: 'Godin',
    greco: 'Greco',
    gretsch: 'Gretsch',
    guild: 'Guild',
    ibanez: 'Ibanez',
    jackson: 'Jackson',
    ken_smith: 'Ken Smith',
    kunaggs: 'Kunaggs',
    lakland: 'Lakland',
    martin: 'Martin',
    maton: 'Maton',
    mayones: 'Mayones',
    moon: 'Moon',
    morris: 'Morris',
    momose: 'Momose',
    music_man: 'Music Man',
    ovation: 'Ovation',
    prs: 'PRS',
    rickenbacker: 'Rickenbacker',
    sadowsky: 'Sadowsky',
    sago: 'Sago',
    saito_guitars: 'Saito Guitars',
    schecter: 'Schecter',
    sire: 'Sire',
    sonic: 'Sonic',
    squier: 'Squier',
    steinberger: 'Steinberger',
    suhr: 'Suhr',
    takamine: 'Takamine',
    taylor: 'Taylor',
    tokai: 'Tokai',
    vigier: 'Vigier',
    warwick: 'Warwick',
    washburn: 'Washburn',
    xotic: 'Xotic',
    yairi: 'Yairi',
    yamaha: 'Yamaha',
    other_guitar: 'その他 ギター',
    
    # ampメーカー
    marshall: 'Marshall',
    vox: 'Vox',
    mesa_boogie: 'Mesa Boogie',
    orange: 'Orange',
    diezel: 'Diezel',
    soldano_amp: 'Soldano Amp',
    synergy_amps: 'Synergy Amps',
    bad_cat: 'Bad Cat',
    bogner: 'Bogner',
    morgan_amp: 'Morgan Amp',
    friedman: 'Friedman',
    matchless_amp: 'Matchless Amp',
    two_rock: 'Two Rock',
    victory_amp: 'Victory Amp',
    carr_amp: 'Carr Amp',
    dr_z_amp: 'Dr. Z Amp',
    tone_king: 'Tone King',
    supro: 'Supro',
    blackstar_amp: 'Blackstar Amp',
    engl: 'Engl',
    hughes_and_kettner: 'Hughes & Kettner',
    peavey: 'Peavey',
    revv_amp: 'Revv Amp',
    positive_grid: 'Positive Grid',
    other_amp_maker: 'その他アンプメーカー',
    
    # effectorメーカー
    boss: 'Boss',
    line_6: 'Line 6',
    tc_electronic: 'TC Electronic',
    strymon: 'Strymon',
    electro_harmonix: 'Electro-Harmonix',
    mxr: 'MXR',
    dunlop: 'Dunlop',
    eventide: 'Eventide',
    wampler_pedals: 'Wampler Pedals',
    jhs_pedals: 'JHS Pedals',
    walrus_audio: 'Walrus Audio',
    earthquaker_devices: 'EarthQuaker Devices',
    chase_bliss_audio: 'Chase Bliss Audio',
    meris: 'Meris',
    source_audio: 'Source Audio',
    keeley_electronics: 'Keeley Electronics',
    way_huge: 'Way Huge',
    fulltone: 'Fulltone',
    xotic_effects: 'Xotic Effects',
    zvex_effects: 'Zvex Effects',
    analogman: 'Analogman',
    catalinbread: 'Catalinbread',
    death_by_audio: 'Death By Audio',
    digitech: 'DigiTech',
    empress_effects: 'Empress Effects',
    gamechanger_audio: 'Gamechanger Audio',
    hologram_electronics: 'Hologram Electronics',
    klon: 'Klon',
    old_blood_noise_endeavors: 'Old Blood Noise Endeavors',
    red_panda: 'Red Panda',
    spaceman_effects: 'Spaceman Effects',
    thorpy_fx: 'Thorpy FX',
    universal_audio: 'Universal Audio',
    other_effector: 'その他 エフェクター'
  }

  def self.ransackable_attributes(auth_object = nil)
    %w[brand category instrument_model]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user]
  end
end
