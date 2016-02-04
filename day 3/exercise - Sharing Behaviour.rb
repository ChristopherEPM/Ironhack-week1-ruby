# Create Car and Engine classes.
# Both of them make their own noises.
# When Car makes noise the output is the noise of
# the Car plus the noise of the engine.
# Create different types of engines that should work
# with any car
class Car
  def initialize(sound,engine)
    @c_sound = sound
    @engine = engine
    @c_sound += engine 
  end
  
  def make_noise
    @c_sound + @engine.make_noise
  end

end

class Engine
  def initialize(sound, cilinders)
    @e_sound = sound
    @cilinders = cilinders
  end
  def make_noise
    @e_sound
  end
end


engine1 = Engine.new("brum bruuuum","1")
engine2 = Engine.new("grgrgrrggrgrr","16")
engine3 = Engine.new("grgrgrrasd sad asd ","121")
coche = Car.new("zzzssz", engine1)
coche.make_noise
coche2 = Car.new("zzzssz asdas d", engine2)
coche2.make_noise