require_relative "train_pas"
require_relative "train_cargo"
require_relative "carriage_pas"
require_relative "carriage_cargo"
require_relative "station"
require_relative "route"

train1 = TrainPas.new
train2 = TrainCargo.new

carriage1 = CarriagePas.new
carriage2 = CarriagePas.new
carriage3 = CarriagePas.new

carriage_cargo1 = CarriageCargo.new
carriage_cargo2 = CarriageCargo.new
carriage_cargo3 = CarriageCargo.new
carriage_cargo4 = CarriageCargo.new

train1.plus_carriage carriage1
train1.plus_carriage carriage2
train1.plus_carriage carriage3

train2.plus_carriage carriage_cargo1
train2.plus_carriage carriage_cargo2
train2.plus_carriage carriage_cargo3
train2.plus_carriage carriage_cargo4

station1 = Station.new("kharkov")
station2 = Station.new("moskva")
station3 = Station.new("odessa")
station4 = Station.new("kiev")

station1.take train1
station1.take train2

station1.list_type

station1.take_off train1
station1.take_off train2

route1 = Route.new

route1.station_add station1
route1.station_add station2
route1.station_add station3
route1.station_add station4

train2.route_take route1

train2.route_go
