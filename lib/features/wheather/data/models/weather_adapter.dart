import 'package:afronex_task_1/features/wheather/data/models/weather_model.dart';
import 'package:hive/hive.dart';

class WeatherModelAdapter extends TypeAdapter<WeatherModel> {
  @override
  final int typeId = 1; // Unique ID for this adapter

  @override
  WeatherModel read(BinaryReader reader) {
    // Read data from binary and create a WeatherModel object
    return WeatherModel(
      coord: Coord.fromJson(reader.readMap()),
      weather: (reader.readList() as List<dynamic>).map((e) => Weather.fromJson(e)).toList(),
      base: reader.readString(),
      main: Main.fromJson(reader.readMap()),
      visibility: reader.readInt(),
      wind: Wind.fromJson(reader.readMap()),
      clouds: Clouds.fromJson(reader.readMap()),
      dt: reader.readInt(),
      sys: Sys.fromJson(reader.readMap()),
      timezone: reader.readInt(),
      id: reader.readInt(),
      name: reader.readString(),
      cod: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, WeatherModel obj) {
    // Write data from WeatherModel object to binary
    writer.writeMap(obj.coord!.toJson());
    writer.writeList(obj.weather!.map((e) => e.toJson()).toList());
    writer.writeString(obj.base ?? ''); // Use null-aware operator to handle null values
    writer.writeMap(obj.main!.toJson());
    writer.writeInt(obj.visibility ?? 0); // Use null-aware operator to handle null values
    writer.writeMap(obj.wind!.toJson());
    writer.writeMap(obj.clouds!.toJson());
    writer.writeInt(obj.dt ?? 0); // Use null-aware operator to handle null values
    writer.writeMap(obj.sys!.toJson());
    writer.writeInt(obj.timezone ?? 0); // Use null-aware operator to handle null values
    writer.writeInt(obj.id ?? 0); // Use null-aware operator to handle null values
    writer.writeString(obj.name ?? ''); // Use null-aware operator to handle null values
    writer.writeInt(obj.cod ?? 0); // Use null-aware operator to handle null values
  }
}
