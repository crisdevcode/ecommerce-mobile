/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Restaurant type in your schema. */
@immutable
class Restaurant extends Model {
  static const classType = const _RestaurantModelType();
  final String id;
  final String? _name;
  final String? _image;
  final double? _deliveryFee;
  final int? _minDeliveryTime;
  final int? _maxDeliveryTime;
  final double? _rating;
  final String? _address;
  final double? _lat;
  final double? _lng;
  final List<Dish>? _Dishes;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  RestaurantModelIdentifier get modelIdentifier {
      return RestaurantModelIdentifier(
        id: id
      );
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get image {
    try {
      return _image!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get deliveryFee {
    try {
      return _deliveryFee!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get minDeliveryTime {
    try {
      return _minDeliveryTime!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get maxDeliveryTime {
    try {
      return _maxDeliveryTime!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double? get rating {
    return _rating;
  }
  
  String get address {
    try {
      return _address!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get lat {
    try {
      return _lat!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get lng {
    try {
      return _lng!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<Dish>? get Dishes {
    return _Dishes;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Restaurant._internal({required this.id, required name, required image, required deliveryFee, required minDeliveryTime, required maxDeliveryTime, rating, required address, required lat, required lng, Dishes, createdAt, updatedAt}): _name = name, _image = image, _deliveryFee = deliveryFee, _minDeliveryTime = minDeliveryTime, _maxDeliveryTime = maxDeliveryTime, _rating = rating, _address = address, _lat = lat, _lng = lng, _Dishes = Dishes, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Restaurant({String? id, required String name, required String image, required double deliveryFee, required int minDeliveryTime, required int maxDeliveryTime, double? rating, required String address, required double lat, required double lng, List<Dish>? Dishes}) {
    return Restaurant._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      image: image,
      deliveryFee: deliveryFee,
      minDeliveryTime: minDeliveryTime,
      maxDeliveryTime: maxDeliveryTime,
      rating: rating,
      address: address,
      lat: lat,
      lng: lng,
      Dishes: Dishes != null ? List<Dish>.unmodifiable(Dishes) : Dishes);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Restaurant &&
      id == other.id &&
      _name == other._name &&
      _image == other._image &&
      _deliveryFee == other._deliveryFee &&
      _minDeliveryTime == other._minDeliveryTime &&
      _maxDeliveryTime == other._maxDeliveryTime &&
      _rating == other._rating &&
      _address == other._address &&
      _lat == other._lat &&
      _lng == other._lng &&
      DeepCollectionEquality().equals(_Dishes, other._Dishes);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Restaurant {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("image=" + "$_image" + ", ");
    buffer.write("deliveryFee=" + (_deliveryFee != null ? _deliveryFee!.toString() : "null") + ", ");
    buffer.write("minDeliveryTime=" + (_minDeliveryTime != null ? _minDeliveryTime!.toString() : "null") + ", ");
    buffer.write("maxDeliveryTime=" + (_maxDeliveryTime != null ? _maxDeliveryTime!.toString() : "null") + ", ");
    buffer.write("rating=" + (_rating != null ? _rating!.toString() : "null") + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("lat=" + (_lat != null ? _lat!.toString() : "null") + ", ");
    buffer.write("lng=" + (_lng != null ? _lng!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Restaurant copyWith({String? name, String? image, double? deliveryFee, int? minDeliveryTime, int? maxDeliveryTime, double? rating, String? address, double? lat, double? lng, List<Dish>? Dishes}) {
    return Restaurant._internal(
      id: id,
      name: name ?? this.name,
      image: image ?? this.image,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      minDeliveryTime: minDeliveryTime ?? this.minDeliveryTime,
      maxDeliveryTime: maxDeliveryTime ?? this.maxDeliveryTime,
      rating: rating ?? this.rating,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      Dishes: Dishes ?? this.Dishes);
  }
  
  Restaurant.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _image = json['image'],
      _deliveryFee = (json['deliveryFee'] as num?)?.toDouble(),
      _minDeliveryTime = (json['minDeliveryTime'] as num?)?.toInt(),
      _maxDeliveryTime = (json['maxDeliveryTime'] as num?)?.toInt(),
      _rating = (json['rating'] as num?)?.toDouble(),
      _address = json['address'],
      _lat = (json['lat'] as num?)?.toDouble(),
      _lng = (json['lng'] as num?)?.toDouble(),
      _Dishes = json['Dishes'] is List
        ? (json['Dishes'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Dish.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'image': _image, 'deliveryFee': _deliveryFee, 'minDeliveryTime': _minDeliveryTime, 'maxDeliveryTime': _maxDeliveryTime, 'rating': _rating, 'address': _address, 'lat': _lat, 'lng': _lng, 'Dishes': _Dishes?.map((Dish? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'name': _name, 'image': _image, 'deliveryFee': _deliveryFee, 'minDeliveryTime': _minDeliveryTime, 'maxDeliveryTime': _maxDeliveryTime, 'rating': _rating, 'address': _address, 'lat': _lat, 'lng': _lng, 'Dishes': _Dishes, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<RestaurantModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<RestaurantModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField IMAGE = QueryField(fieldName: "image");
  static final QueryField DELIVERYFEE = QueryField(fieldName: "deliveryFee");
  static final QueryField MINDELIVERYTIME = QueryField(fieldName: "minDeliveryTime");
  static final QueryField MAXDELIVERYTIME = QueryField(fieldName: "maxDeliveryTime");
  static final QueryField RATING = QueryField(fieldName: "rating");
  static final QueryField ADDRESS = QueryField(fieldName: "address");
  static final QueryField LAT = QueryField(fieldName: "lat");
  static final QueryField LNG = QueryField(fieldName: "lng");
  static final QueryField DISHES = QueryField(
    fieldName: "Dishes",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: 'Dish'));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Restaurant";
    modelSchemaDefinition.pluralName = "Restaurants";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Restaurant.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Restaurant.IMAGE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Restaurant.DELIVERYFEE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Restaurant.MINDELIVERYTIME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Restaurant.MAXDELIVERYTIME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Restaurant.RATING,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Restaurant.ADDRESS,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Restaurant.LAT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Restaurant.LNG,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Restaurant.DISHES,
      isRequired: false,
      ofModelName: 'Dish',
      associatedKey: Dish.RESTAURANTID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _RestaurantModelType extends ModelType<Restaurant> {
  const _RestaurantModelType();
  
  @override
  Restaurant fromJson(Map<String, dynamic> jsonData) {
    return Restaurant.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Restaurant';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Restaurant] in your schema.
 */
@immutable
class RestaurantModelIdentifier implements ModelIdentifier<Restaurant> {
  final String id;

  /** Create an instance of RestaurantModelIdentifier using [id] the primary key. */
  const RestaurantModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'RestaurantModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is RestaurantModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}