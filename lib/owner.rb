class Owner

  attr_reader :species
  attr_accessor :name, :pets

  # Class methods
  #  keeps track of the owners that have been created (FAILED - 1)
  #  can count how many owners have been created (FAILED - 2)
  #  can reset the owners that have been created (FAILED - 3)

  #what's the diff between OWNERS and @@all again?
  @@all = []     #tracks all owners created 

  def initialize(species)
    @species = species
    @@all << self
    @pets = {fishes: [], cats: [], dogs: []}
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    @pets[:cats] << new_cat
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    @pets[:dogs] << new_dog
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    @pets[:fishes] << new_fish
  end

  def walk_dogs
    #print @pets
    #{:fishes=>[], :cats=>[], :dogs=>[#<Dog:0x007f8297a8c5c0 @name="Daisy", @mood="nervous">]}
    #print @pets[:dogs]
    #[#<Dog:0x007fb327298588 @name="Daisy", @mood="nervous">]
    pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
    #print @pets[:dogs]
    #[#<Dog:0x007fb327298588 @name="Daisy", @mood="happy">]
  end

  def play_with_cats
    pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    pets.each do |species, animals|
      animals.each do |animal|
        animal.mood = "nervous"
      end
      animals.clear    #sets it to an empty array again :( no pets
    end
  end

  def list_pets
    dog_num = pets[:dogs].count
    cat_num = pets[:cats].count
    fish_num = pets[:fishes].count
    "I have #{fish_num} fish, #{dog_num} dog(s), and #{cat_num} cat(s)."
  end


end
