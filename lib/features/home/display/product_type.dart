enum ProductType {
  studentsEquipments(type: "students"),
  materials(type: "Materials"),
  machines(type: "Machines"),

  devices(type: "Devices"),
  consumables(type: "Equipment"),
  orthodontics(type: "Correction"),
  medicalClothes(type: "Clothes"),
  filesBurs(type: "Files");
//devices,consumables,medicalClothes,filesBurs,orthodontics,materials,studentsEquipments,machines
  final String type;

  const ProductType({
    required this.type,
  });
}
