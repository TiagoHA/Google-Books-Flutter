// To parse this JSON data, do
//
//     final booksModel = booksModelFromJson(jsonString);

import 'dart:convert';

BooksModel booksModelFromJson(String str) {
  final jsonData = json.decode(str);
  return BooksModel.fromJson(jsonData);
}

String booksModelToJson(BooksModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class BooksModel {
  String kind;
  int totalItems;
  List<Item> items;

  BooksModel({
    this.kind,
    this.totalItems,
    this.items,
  });

  factory BooksModel.fromJson(Map<String, dynamic> json) => new BooksModel(
        kind: json["kind"],
        totalItems: json["totalItems"],
        items: new List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "totalItems": totalItems,
        "items": new List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Kind kind;
  String id;
  String etag;
  String selfLink;
  VolumeInfo volumeInfo;
  SaleInfo saleInfo;
  AccessInfo accessInfo;
  SearchInfo searchInfo;

  Item({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  factory Item.fromJson(Map<String, dynamic> json) => new Item(
        kind: kindValues.map[json["kind"]],
        id: json["id"],
        etag: json["etag"],
        selfLink: json["selfLink"],
        volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
        saleInfo: SaleInfo.fromJson(json["saleInfo"]),
        accessInfo: AccessInfo.fromJson(json["accessInfo"]),
        searchInfo: json["searchInfo"] == null
            ? null
            : SearchInfo.fromJson(json["searchInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kindValues.reverse[kind],
        "id": id,
        "etag": etag,
        "selfLink": selfLink,
        "volumeInfo": volumeInfo.toJson(),
        "saleInfo": saleInfo.toJson(),
        "accessInfo": accessInfo.toJson(),
        "searchInfo": searchInfo == null ? null : searchInfo.toJson(),
      };
}

class AccessInfo {
  Country country;
  Viewability viewability;
  bool embeddable;
  bool publicDomain;
  TextToSpeechPermission textToSpeechPermission;
  Epub epub;
  Epub pdf;
  String webReaderLink;
  AccessViewStatus accessViewStatus;
  bool quoteSharingAllowed;

  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) => new AccessInfo(
        country: countryValues.map[json["country"]],
        viewability: viewabilityValues.map[json["viewability"]],
        embeddable: json["embeddable"],
        publicDomain: json["publicDomain"],
        textToSpeechPermission:
            textToSpeechPermissionValues.map[json["textToSpeechPermission"]],
        epub: Epub.fromJson(json["epub"]),
        pdf: Epub.fromJson(json["pdf"]),
        webReaderLink: json["webReaderLink"],
        accessViewStatus: accessViewStatusValues.map[json["accessViewStatus"]],
        quoteSharingAllowed: json["quoteSharingAllowed"],
      );

  Map<String, dynamic> toJson() => {
        "country": countryValues.reverse[country],
        "viewability": viewabilityValues.reverse[viewability],
        "embeddable": embeddable,
        "publicDomain": publicDomain,
        "textToSpeechPermission":
            textToSpeechPermissionValues.reverse[textToSpeechPermission],
        "epub": epub.toJson(),
        "pdf": pdf.toJson(),
        "webReaderLink": webReaderLink,
        "accessViewStatus": accessViewStatusValues.reverse[accessViewStatus],
        "quoteSharingAllowed": quoteSharingAllowed,
      };
}

enum AccessViewStatus { SAMPLE, NONE }

final accessViewStatusValues = new EnumValues(
    {"NONE": AccessViewStatus.NONE, "SAMPLE": AccessViewStatus.SAMPLE});

enum Country { BR }

final countryValues = new EnumValues({"BR": Country.BR});

class Epub {
  bool isAvailable;
  String acsTokenLink;

  Epub({
    this.isAvailable,
    this.acsTokenLink,
  });

  factory Epub.fromJson(Map<String, dynamic> json) => new Epub(
        isAvailable: json["isAvailable"],
        acsTokenLink:
            json["acsTokenLink"] == null ? null : json["acsTokenLink"],
      );

  Map<String, dynamic> toJson() => {
        "isAvailable": isAvailable,
        "acsTokenLink": acsTokenLink == null ? null : acsTokenLink,
      };
}

enum TextToSpeechPermission { ALLOWED, ALLOWED_FOR_ACCESSIBILITY }

final textToSpeechPermissionValues = new EnumValues({
  "ALLOWED": TextToSpeechPermission.ALLOWED,
  "ALLOWED_FOR_ACCESSIBILITY": TextToSpeechPermission.ALLOWED_FOR_ACCESSIBILITY
});

enum Viewability { PARTIAL, NO_PAGES, ALL_PAGES }

final viewabilityValues = new EnumValues({
  "ALL_PAGES": Viewability.ALL_PAGES,
  "NO_PAGES": Viewability.NO_PAGES,
  "PARTIAL": Viewability.PARTIAL
});

enum Kind { BOOKS_VOLUME }

final kindValues = new EnumValues({"books#volume": Kind.BOOKS_VOLUME});

class SaleInfo {
  Country country;
  Saleability saleability;
  bool isEbook;
  SaleInfoListPrice listPrice;
  SaleInfoListPrice retailPrice;
  String buyLink;
  List<Offer> offers;

  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) => new SaleInfo(
        country: countryValues.map[json["country"]],
        saleability: saleabilityValues.map[json["saleability"]],
        isEbook: json["isEbook"],
        listPrice: json["listPrice"] == null
            ? null
            : SaleInfoListPrice.fromJson(json["listPrice"]),
        retailPrice: json["retailPrice"] == null
            ? null
            : SaleInfoListPrice.fromJson(json["retailPrice"]),
        buyLink: json["buyLink"] == null ? null : json["buyLink"],
        offers: json["offers"] == null
            ? null
            : new List<Offer>.from(
                json["offers"].map((x) => Offer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "country": countryValues.reverse[country],
        "saleability": saleabilityValues.reverse[saleability],
        "isEbook": isEbook,
        "listPrice": listPrice == null ? null : listPrice.toJson(),
        "retailPrice": retailPrice == null ? null : retailPrice.toJson(),
        "buyLink": buyLink == null ? null : buyLink,
        "offers": offers == null
            ? null
            : new List<dynamic>.from(offers.map((x) => x.toJson())),
      };
}

class SaleInfoListPrice {
  double amount;
  CurrencyCode currencyCode;

  SaleInfoListPrice({
    this.amount,
    this.currencyCode,
  });

  factory SaleInfoListPrice.fromJson(Map<String, dynamic> json) =>
      new SaleInfoListPrice(
        amount: json["amount"].toDouble(),
        currencyCode: currencyCodeValues.map[json["currencyCode"]],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currencyCode": currencyCodeValues.reverse[currencyCode],
      };
}

enum CurrencyCode { BRL }

final currencyCodeValues = new EnumValues({"BRL": CurrencyCode.BRL});

class Offer {
  int finskyOfferType;
  OfferListPrice listPrice;
  OfferListPrice retailPrice;
  bool giftable;

  Offer({
    this.finskyOfferType,
    this.listPrice,
    this.retailPrice,
    this.giftable,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => new Offer(
        finskyOfferType: json["finskyOfferType"],
        listPrice: OfferListPrice.fromJson(json["listPrice"]),
        retailPrice: OfferListPrice.fromJson(json["retailPrice"]),
        giftable: json["giftable"],
      );

  Map<String, dynamic> toJson() => {
        "finskyOfferType": finskyOfferType,
        "listPrice": listPrice.toJson(),
        "retailPrice": retailPrice.toJson(),
        "giftable": giftable,
      };
}

class OfferListPrice {
  num amountInMicros;
  CurrencyCode currencyCode;

  OfferListPrice({
    this.amountInMicros,
    this.currencyCode,
  });

  factory OfferListPrice.fromJson(Map<String, dynamic> json) =>
      new OfferListPrice(
        amountInMicros: json["amountInMicros"],
        currencyCode: currencyCodeValues.map[json["currencyCode"]],
      );

  Map<String, dynamic> toJson() => {
        "amountInMicros": amountInMicros,
        "currencyCode": currencyCodeValues.reverse[currencyCode],
      };
}

enum Saleability { FOR_SALE, NOT_FOR_SALE }

final saleabilityValues = new EnumValues({
  "FOR_SALE": Saleability.FOR_SALE,
  "NOT_FOR_SALE": Saleability.NOT_FOR_SALE
});

class SearchInfo {
  String textSnippet;

  SearchInfo({
    this.textSnippet,
  });

  factory SearchInfo.fromJson(Map<String, dynamic> json) => new SearchInfo(
        textSnippet: json["textSnippet"],
      );

  Map<String, dynamic> toJson() => {
        "textSnippet": textSnippet,
      };
}

class VolumeInfo {
  String title;
  List<String> authors;
  String publisher;
  String publishedDate;
  String description;
  List<IndustryIdentifier> industryIdentifiers;
  ReadingModes readingModes;
  int pageCount;
  PrintType printType;
  List<String> categories;
  double averageRating;
  int ratingsCount;
  MaturityRating maturityRating;
  bool allowAnonLogging;
  String contentVersion;
  ImageLinks imageLinks;
  Language language;
  String previewLink;
  String infoLink;
  String canonicalVolumeLink;
  PanelizationSummary panelizationSummary;
  String subtitle;

  VolumeInfo({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
    this.panelizationSummary,
    this.subtitle,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => new VolumeInfo(
        title: json["title"],
        authors: json["authors"] == null
            ? null
            : new List<String>.from(json["authors"].map((x) => x)),
        publisher: json["publisher"] == null ? null : json["publisher"],
        publishedDate:
            json["publishedDate"] == null ? null : json["publishedDate"],
        description: json["description"] == null ? 'No description' : json["description"],
        industryIdentifiers: json["industryIdentifiers"] == null
            ? null
            : new List<IndustryIdentifier>.from(json["industryIdentifiers"]
                .map((x) => IndustryIdentifier.fromJson(x))),
        readingModes: ReadingModes.fromJson(json["readingModes"]),
        pageCount: json["pageCount"] == null ? null : json["pageCount"],
        printType: printTypeValues.map[json["printType"]],
        categories: json["categories"] == null
            ? null
            : new List<String>.from(json["categories"].map((x) => x)),
        averageRating: json["averageRating"] == null
            ? null
            : json["averageRating"].toDouble(),
        ratingsCount:
            json["ratingsCount"] == null ? null : json["ratingsCount"],
        maturityRating: maturityRatingValues.map[json["maturityRating"]],
        allowAnonLogging: json["allowAnonLogging"],
        contentVersion: json["contentVersion"],
        imageLinks: ImageLinks.fromJson(json["imageLinks"]),
        language: languageValues.map[json["language"]],
        previewLink: json["previewLink"],
        infoLink: json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"],
        panelizationSummary: json["panelizationSummary"] == null
            ? null
            : PanelizationSummary.fromJson(json["panelizationSummary"]),
        subtitle: json["subtitle"] == null ? null : json["subtitle"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "authors": authors == null
            ? null
            : new List<dynamic>.from(authors.map((x) => x)),
        "publisher": publisher == null ? null : publisher,
        "publishedDate": publishedDate == null ? null : publishedDate,
        "description": description == null ? null : description,
        "industryIdentifiers": industryIdentifiers == null
            ? null
            : new List<dynamic>.from(
                industryIdentifiers.map((x) => x.toJson())),
        "readingModes": readingModes.toJson(),
        "pageCount": pageCount == null ? null : pageCount,
        "printType": printTypeValues.reverse[printType],
        "categories": categories == null
            ? null
            : new List<dynamic>.from(categories.map((x) => x)),
        "averageRating": averageRating == null ? null : averageRating,
        "ratingsCount": ratingsCount == null ? null : ratingsCount,
        "maturityRating": maturityRatingValues.reverse[maturityRating],
        "allowAnonLogging": allowAnonLogging,
        "contentVersion": contentVersion,
        "imageLinks": imageLinks.toJson(),
        "language": languageValues.reverse[language],
        "previewLink": previewLink,
        "infoLink": infoLink,
        "canonicalVolumeLink": canonicalVolumeLink,
        "panelizationSummary":
            panelizationSummary == null ? null : panelizationSummary.toJson(),
        "subtitle": subtitle == null ? null : subtitle,
      };
}

class ImageLinks {
  String smallThumbnail;
  String thumbnail;

  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  factory ImageLinks.fromJson(Map<String, dynamic> json) => new ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail,
        "thumbnail": thumbnail,
      };
}

class IndustryIdentifier {
  Type type;
  String identifier;

  IndustryIdentifier({
    this.type,
    this.identifier,
  });

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) =>
      new IndustryIdentifier(
        type: typeValues.map[json["type"]],
        identifier: json["identifier"],
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "identifier": identifier,
      };
}

enum Type { ISBN_13, ISBN_10, OTHER }

final typeValues = new EnumValues(
    {"ISBN_10": Type.ISBN_10, "ISBN_13": Type.ISBN_13, "OTHER": Type.OTHER});

enum Language { EN, PT }

final languageValues = new EnumValues({"en": Language.EN, "pt": Language.PT});

enum MaturityRating { NOT_MATURE }

final maturityRatingValues =
    new EnumValues({"NOT_MATURE": MaturityRating.NOT_MATURE});

class PanelizationSummary {
  bool containsEpubBubbles;
  bool containsImageBubbles;

  PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) =>
      new PanelizationSummary(
        containsEpubBubbles: json["containsEpubBubbles"],
        containsImageBubbles: json["containsImageBubbles"],
      );

  Map<String, dynamic> toJson() => {
        "containsEpubBubbles": containsEpubBubbles,
        "containsImageBubbles": containsImageBubbles,
      };
}

enum PrintType { BOOK }

final printTypeValues = new EnumValues({"BOOK": PrintType.BOOK});

class ReadingModes {
  bool text;
  bool image;

  ReadingModes({
    this.text,
    this.image,
  });

  factory ReadingModes.fromJson(Map<String, dynamic> json) => new ReadingModes(
        text: json["text"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "image": image,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
