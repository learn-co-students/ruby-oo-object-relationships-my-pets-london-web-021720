class Owner
  # code goes here

  @@all = []
  attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{species}."
  end

  def cats
    Cat.all.select { |cat| cat.owner == self}
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each { |dog| dog.mood = "happy" }
  end

  def feed_cats
    cats.each { |cat| cat.mood = "happy" }
  end

  def make_pets_nervous(pets)
    pets.each { |pet| pet.mood = "nervous" }
  end

  def remove_owner(pets)
    pets.each { |pet| pet.owner = nil}
  end

  def sell_pets
    pets = cats + dogs
    make_pets_nervous(pets)
    remove_owner(pets)
  end

  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    all.count
  end

  def self.reset_all
    @@all = []
  end
end