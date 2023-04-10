

class HouseDetail {
  bool? status;
  Houses? data;
  String? message;

  HouseDetail({this.status, this.data, this.message});

  HouseDetail.fromJson(Map<String, dynamic> json) {
    status = (json['status']);
    data = json['data'] != null ? new Houses.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;

    return data;
  }
}

class Houses {
  dynamic houseId;
  dynamic realtorId;
  String? address;
  String? bedrooms;
  String? annualTax;
  String? neighborhood;
  String? housePrice;
  String? bathrooms;
  String? sQfeet;
  String? builtYear;
  Exterior? exterior;
  Interior? interior;
  List<BedroomList>? bedroomList;
  Community? community;
  Appliances? appliances;
  Kitchen? kitchen;
  Other? other;
  bool? isUploaded;
  List<dynamic>? bedroomImages;
  int?  result;
  String? finalSummary;

  Houses(
      {this.houseId,
        this.realtorId,
        this.address,
        this.bedrooms,
        this.annualTax,
        this.neighborhood,
        this.housePrice,
        this.bathrooms,
        this.bedroomImages,
        this.sQfeet,
        this.finalSummary,
        this.builtYear,
        this.exterior,
        this.interior,
        this.bedroomList,
        this.community,
        this.appliances,
        this.kitchen,
        this.other,
        this.result,
        this.isUploaded = false});

  Houses.fromJson(Map<String, dynamic> json) {
    houseId = json['id'];
    realtorId = json['realtor_id'];
    address = json['address'];
    bedrooms = json['bedrooms'];
    annualTax = json['annual_tax'];
    neighborhood = json['neighborhood'];
    housePrice = json['price'];
    finalSummary = json['summary'];
    bathrooms = (json['baths'] ?? 0).toString();
    sQfeet = json['sq_feet'];
    builtYear = json['built_year'];
    exterior = (json['exterior'] != null && json['exterior'] is Map)
        ? new Exterior.fromJson(json['exterior'])
        : null;
    interior = json['interior'] != null && json['interior'] is Map
        ? new Interior.fromJson(json['interior'])
        : null;
    if (json['bedroomList'] != null) {
      bedroomList = <BedroomList>[];
      json['bedroomList'].forEach((v) {
        bedroomList!.add(new BedroomList.fromJson(v));
      });
    }
    community = json['community'] != null && json['community'] is Map
        ? new Community.fromJson(json['community'])
        : null;
    appliances = json['appliances'] != null && json['appliances'] is Map
        ? new Appliances.fromJson(json['appliances'])
        : null;
    kitchen =
    json['kitchen'] != null && json['kitchen'] is Map ? new Kitchen.fromJson(json['kitchen']) : null;
    other = json['other'] != null && json['other'] is Map ? new Other.fromJson(json['other']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.houseId;
    data['realtor_id'] = this.realtorId;
    data['address'] = this.address;
    data['bedrooms'] = this.bedrooms;
    data['annual_tax'] = this.annualTax;
    data['neighborhood'] = this.neighborhood;
    data['price'] = this.housePrice;
    data['baths'] = this.bathrooms;
    data['sq_feet'] = this.sQfeet;
    data['summary'] = this.finalSummary;
    data['built_year'] = this.builtYear;
    if (this.exterior != null) {
      data['exterior'] = this.exterior!.toJson();
    }
    if (this.interior != null) {
      data['interior'] = this.interior!.toJson();
    }
    if (this.bedroomList != null) {
      data['bedroomList'] = this.bedroomList!.map((v) => v.toJson()).toList();
    }
    if (this.community != null) {
      data['community'] = this.community!.toJson();
    }
    if (this.appliances != null) {
      data['appliances'] = this.appliances!.toJson();
    }
    if (this.kitchen != null) {
      data['kitchen'] = this.kitchen!.toJson();
    }
    if (this.other != null) {
      data['other'] = this.other!.toJson();
    }
    return data;
  }
}

class Exterior {
  String? view;
  String? landScaping;
  String? lawnF;
  String? lawnB;
  String? brick;
  String? vinyl;
  String? deck;
  String? patio;
  String? garage;
  String? windows;
  String? doors;
  String? roof;
  String? fence;
  String? notes;
  List<dynamic>? imageFileList = [];

  Exterior(
      {this.view = "None",
        this.landScaping = "None",
        this.lawnF = "None",
        this.lawnB = "None",
        this.brick = "None",
        this.vinyl = "None",
        this.deck = "None",
        this.patio = "None",
        this.garage = "None",
        this.windows = "None",
        this.doors = "None",
        this.roof = "None",
        this.fence = "None",
        this.notes = "",
        this.imageFileList});

  Exterior.fromJson(Map<String, dynamic> json) {
    view = (json['view']);
    landScaping = json['landscaping'];
    lawnF = json['lawn_f'];
    lawnB = json['lawn_b'];
    brick = json['brick'];
    vinyl = json['vinyl'];
    deck = json['deck'];
    patio = json['patio'];
    garage = json['garage'];
    windows = json['windows'];
    doors = json['doors'];
    roof = json['roof'];
    fence = json['fence'];
    notes = json['notes'];
    imageFileList = json['imageFileList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['view'] = this.view;
    data['landscaping'] = this.landScaping;
    data['lawn_f'] = this.lawnF;
    data['lawn_b'] = this.lawnB;
    data['brick'] = this.brick;
    data['vinyl'] = this.vinyl;
    data['deck'] = this.deck;
    data['patio'] = this.patio;
    data['garage'] = this.garage;
    data['windows'] = this.windows;
    data['doors'] = this.doors;
    data['roof'] = this.roof;
    data['fence'] = this.fence;
    data['notes'] = this.notes;
    data['imageFileList'] = this.imageFileList;

    return data;
  }
}

class Interior {
  String? painting;
  String? ceiling;
  String? windows;
  String? flooring;
  String? stairs;
  String? livingRoom;
  String? size;
  String? carpet;
  String? wood;
  String? familyRoom;
  String? dinningRoom;
  String? powderRoom;
  List<dynamic>? imageFileList = [];
  String? notes;

  Interior(
      {this.painting,
        this.ceiling,
        this.windows,
        this.flooring,
        this.stairs,
        this.livingRoom,
        this.size,
        this.carpet,
        this.wood,
        this.familyRoom,
        this.dinningRoom,
        this.powderRoom,
        this.notes = "",
        this.imageFileList});

  Interior.fromJson(Map<String, dynamic> json) {
    painting = json['painting'];
    ceiling = json['ceiling'];
    windows = json['windows'];
    flooring = json['flooring'];
    stairs = json['stairs'];
    livingRoom = json['living_room'];
    size = json['living_room_size'];
    carpet = json['living_room_carpet'];
    wood = json['living_room_wood'];
    familyRoom = json['family_room'];
    dinningRoom = json['dinning_room'];
    powderRoom = json['powder_room'];
    notes = json['notes'];
    imageFileList = json['imageFileList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['painting'] = this.painting;
    data['ceiling'] = this.ceiling;
    data['windows'] = this.windows;
    data['flooring'] = this.flooring;
    data['stairs'] = this.stairs;
    data['living_room'] = this.livingRoom;
    data['living_room_size'] = this.size;
    data['living_room_carpet'] = this.carpet;
    data['living_room_wood'] = this.wood;
    data['family_room'] = this.familyRoom;
    data['dinning_room'] = this.dinningRoom;
    data['powder_room'] = this.powderRoom;
    data['notes'] = this.notes;
    data['imageFileList'] = this.imageFileList;
    return data;
  }
}

class BedroomList {
  String? roomType;
  String? size;
  String? carpetFloor;
  String? woodFloor;
  String? closetWN;
  String? bathroom;
  String? standing;
  String? tub;

  BedroomList(
      {this.roomType = "masterRoom",
        this.size,
        this.carpetFloor,
        this.woodFloor,
        this.closetWN,
        this.bathroom,
        this.standing,
        this.tub,
      });

  BedroomList.fromJson(Map<String, dynamic> json) {
    roomType = json['type'];
    size = json['size'];
    carpetFloor = json['carpet_floor'];
    woodFloor = json['wood_floor'];
    closetWN = json['closet'];
    bathroom = json['bathroom'];
    standing = json['standing'];
    tub = json['tub'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.roomType;
    data['size'] = this.size;
    data['carpet_floor'] = this.carpetFloor;
    data['wood_floor'] = this.woodFloor;
    data['closet'] = this.closetWN;
    data['bathroom'] = this.bathroom;
    data['standing'] = this.standing;
    data['tub'] = this.tub;

    return data;
  }
}

class Community {
  String? schools;
  String? shopping;
  String? distanceToAirport;
  String? distanceToGo;
  String? publicTransport;
  List<dynamic>? imageFileList = [];
  String? notes;

  Community(
      {this.schools  = "None",
        this.shopping  = "None",
        this.distanceToAirport = "None",
        this.distanceToGo = "None",
        this.publicTransport = "None",this.notes = "",this.imageFileList});

  Community.fromJson(Map<String, dynamic> json) {
    schools = json['schools'];
    shopping = json['shopping'];
    distanceToAirport = json['airport_distance'];
    distanceToGo = json['distance_to_go'];
    publicTransport = json['public_transport'];
    notes = json['notes'];
    imageFileList = json['imageFileList'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schools'] = this.schools;
    data['shopping'] = this.shopping;
    data['airport_distance'] = this.distanceToAirport;
    data['distance_to_go'] = this.distanceToGo;
    data['public_transport'] = this.publicTransport;
    data['notes'] = this.notes;
    data['imageFileList'] = this.imageFileList;

    return data;
  }
}

class Appliances {
  String? refrigerator;
  String? dishWasher;
  String? washer;
  String? ac;
  String? furnace;
  List<dynamic>? imageFileList = [];
  String? notes;

  Appliances(
      {this.notes = "",this.refrigerator = "None", this.dishWasher = "None", this.washer = "None", this.ac = "None", this.furnace= "None",this.imageFileList});

  Appliances.fromJson(Map<String, dynamic> json) {
    refrigerator = json['refrigerator'];
    dishWasher = json['dish_washer'];
    washer = json['washer'];
    ac = json['ac'];
    furnace = json['furnace'];
    notes = json['notes'];
    imageFileList = json['imageFileList'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refrigerator'] = this.refrigerator;
    data['dish_washer'] = this.dishWasher;
    data['washer'] = this.washer;
    data['ac'] = this.ac;
    data['furnace'] = this.furnace;
    data['notes'] = this.notes;
    data['imageFileList'] = this.imageFileList;

    return data;
  }
}

class Kitchen {
  String? cabinets;
  String? flooring;
  String? microOven;
  String? backSplash;
  String? island;
  List<dynamic>? imageFileList;
  String? notes;

  Kitchen(
      {this.cabinets,
        this.flooring,
        this.microOven,
        this.backSplash,
        this.island,
        this.notes = "",
        this.imageFileList}
      );

  Kitchen.fromJson(Map<String, dynamic> json) {
    cabinets = json['cabinets'];
    flooring = json['flooring'];
    microOven = json['microoven'];
    backSplash = json['backsplash'];
    island = json['island'];
    notes = json['notes'];
    imageFileList = json['imageFileList'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cabinets'] = this.cabinets;
    data['flooring'] = this.flooring;
    data['microoven'] = this.microOven;
    data['backsplash'] = this.backSplash;
    data['island'] = this.island;
    data['notes'] = this.notes;
    data['imageFileList'] = this.imageFileList;

    return data;
  }
}

class Other {
  String? basement;
  String? garage;
  String? furnished;
  String? notes;

  List<dynamic>? imageFileList = [];

  Other({this.notes = "",this.basement = "None", this.garage = "None", this.furnished = "None",this.imageFileList});

  Other.fromJson(Map<String, dynamic> json) {
    basement = json['basement'];
    garage = json['garage'];
    furnished = json['furnished_or_unfurnished'];
    notes = json['notes'];
    imageFileList = json['imageFileList'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['basement'] = this.basement;
    data['garage'] = this.garage;
    data['furnished_or_unfurnished'] = this.furnished;
    data['notes'] = this.notes;
    data['imageFileList'] = this.imageFileList;

    return data;
  }
}
