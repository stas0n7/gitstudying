require_relative "instance_counter"
require_relative "manufacturer"
require_relative "train"
require_relative "train_pas"
require_relative "train_cargo"
require_relative "carriage"
require_relative "carriage_pas"
require_relative "carriage_cargo"
require_relative "station"
require_relative "route"

train_pas = TrainPas.new "321-65"
train_cargo = TrainCargo.new "65715"

carriage_pas1 = CarriagePas.new
carriage_pas2 = CarriagePas.new
carriage_pas3 = CarriagePas.new

carriage_cargo4 = CarriageCargo.new
carriage_cargo5 = CarriageCargo.new
carriage_cargo6 = CarriageCargo.new
carriage_cargo7 = CarriageCargo.new

train_pas.plus_carriage carriage_pas1
train_pas.plus_carriage carriage_pas2
train_pas.plus_carriage carriage_pas3

train_cargo.plus_carriage carriage_cargo4
train_cargo.plus_carriage carriage_cargo5
train_cargo.plus_carriage carriage_cargo6
train_cargo.plus_carriage carriage_cargo7

station1 = Station.new "kharkov"
station2 = Station.new "moskva"
station3 = Station.new "odessa"
station4 = Station.new "kiev"

station1.take train_pas
station1.take train_cargo

station1.list_type

station1.take_off train_pas
station1.take_off train_cargo

route1 = Route.new

route1.station_add station1
route1.station_add station2
route1.station_add station3
route1.station_add station4

train_cargo.route_take route1

train_cargo.route_go
