month = {
  january: 31,
  february: 28,
  march: 31,
  april: 30,
  may: 31,
  june: 30,
  july: 31,
  august: 30,
  september: 30,
  october: 31,
  november: 29,
  december: 31,
}
month30 = month.select { |key, value| value == 30 }
puts month30
