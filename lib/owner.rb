require 'pry'
class Owner

  attr_reader  :name, :species
  attr_accessor  :say_species

  @@all = [] 
  
  def initialize (name)
      @name =name 
      @species = "human"
      @say_species = "I am a #{@species}."
      @@all << self
    end


  def self.all 
    @@all 
  end 

  def self.count 
  @@all.length 
  end 

  def self.reset_all 
    @@all = []
  end


  def cats
    Cat.all.select {|cats| cats.owner == self}

  end 

  def dogs 
    Dog.all.select {|dog| dog.owner ==self}
  end 

  def buy_cat(cat_name)
  #   if cats.select {|cats| cats.name == cat_name}
  #      return 
  # else 
     cat_name = Cat.new(cat_name,self)
  # end
  end 

  def buy_dog(dog_name)
      dog_name = Dog.new(dog_name, self)
  end 


  def walk_dogs 
      dogs.each {|dog| dog.mood = "happy"}
  end 

  def feed_cats
      cats.each {|cat| cat.mood = "happy"}
  end 

  def sell_pets 
      dogs.each {|dog| dog.owner = nil;
      dog.mood = "nervous"
      
    }
      cats.each {|cat| cat.owner = nil;
      cat.mood = "nervous"
    
    }

  end

  def list_pets 
    return "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end 

  

end


