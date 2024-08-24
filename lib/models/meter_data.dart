class MeterData {
  final String voltage;
  final String current;
  final String power;
  final String energy;
  final String powerFactor;

  MeterData({
    required this.voltage,
    required this.current,
    required this.power,
    required this.energy,
    required this.powerFactor,
  });

  factory MeterData.fromJson(Map<String, dynamic> json) {
    return MeterData(
      voltage: json['voltage'] ?? 'Error',
      current: json['current'] ?? 'Error',
      power: json['power'] ?? 'Error',
      energy: json['energy'] ?? 'Error',
      powerFactor: json['powerFactor'] ?? 'Error',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'voltage': voltage,
      'current': current,
      'power': power,
      'energy': energy,
      'powerFactor': powerFactor,
    };
  }
}
