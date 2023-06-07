class Planet_Model {
  int id;
  String name;
  String name1;
  String image;
  String details1;
  String EquatorialDiameter;
  String Mass;
  String MeanDistFromSun;
  String RotationPeriod;
  String solarorbitperiod;
  String surfacegravity;
  String SurfaceTemp;
  String gallery1;
  String gallery2;
  String gallery3;
  String gallery4;
  String gallery5;
  String Exploration;
  String indeapth;
  String OrbitDistancekm;
  String EquatorialRadiuskm;
  String Volume;
  String Density;
  String EscapeVelocity;
  String AtmosphericConstituents;
  String Rings;

  Planet_Model({
    required this.id,
    required this.name,
    required this.name1,
    required this.image,
    required this.details1,
    required this.EquatorialDiameter,
    required this.Mass,
    required this.MeanDistFromSun,
    required this.RotationPeriod,
    required this.solarorbitperiod,
    required this.surfacegravity,
    required this.SurfaceTemp,
    required this.gallery1,
    required this.gallery2,
    required this.gallery3,
    required this.gallery4,
    required this.gallery5,
    required this.Exploration,
    required this.indeapth,
    required this.OrbitDistancekm,
    required this.EquatorialRadiuskm,
    required this.Volume,
    required this.Density,
    required this.EscapeVelocity,
    required this.AtmosphericConstituents,
    required this.Rings,
  });

  factory Planet_Model.frommap({required Map data}) {
    return Planet_Model(
      id: data['id'],
      name: data['name'],
      name1: data['name1'],
      image: data['image'],
      details1: data['Details1'],
      EquatorialDiameter: data['Equatorial Diameter'],
      Mass: data['Mass'],
      MeanDistFromSun: data['Mean Dist.From Sun'],
      RotationPeriod: data['Rotation Period'],
      solarorbitperiod: data['solar orbit period'],
      surfacegravity: data['surface gravity'],
      SurfaceTemp: data['Surface Temp'],
      gallery1: data['Gallery1'],
      gallery2: data['Gallery2'],
      gallery3: data['Gallery3'],
      gallery4: data['Gallery4'],
      gallery5: data['Gallery5'],
      Exploration: data['Exploration'],
      indeapth: data['in-deapth'],
      OrbitDistancekm: data['Orbit Distance-km'],
      EquatorialRadiuskm: data['Equatorial Radius-km'],
      Volume: data['Volume(km3)'],
      Density: data['Density(g/cm3)'],
      EscapeVelocity: data['Escape Velocity(km/h)'],
      AtmosphericConstituents: data['Atmospheric Constituents'],
      Rings: data['Rings'],
    );
  }
}
