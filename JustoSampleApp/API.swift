//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct CollectionFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(published: Swift.Optional<CollectionPublished?> = nil, search: Swift.Optional<String?> = nil, isBanner: Swift.Optional<Bool?> = nil, isHidden: Swift.Optional<Bool?> = nil) {
    graphQLMap = ["published": published, "search": search, "isBanner": isBanner, "isHidden": isHidden]
  }

  public var published: Swift.Optional<CollectionPublished?> {
    get {
      return graphQLMap["published"] as? Swift.Optional<CollectionPublished?> ?? Swift.Optional<CollectionPublished?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "published")
    }
  }

  public var search: Swift.Optional<String?> {
    get {
      return graphQLMap["search"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "search")
    }
  }

  public var isBanner: Swift.Optional<Bool?> {
    get {
      return graphQLMap["isBanner"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "isBanner")
    }
  }

  public var isHidden: Swift.Optional<Bool?> {
    get {
      return graphQLMap["isHidden"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "isHidden")
    }
  }
}

public enum CollectionPublished: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case published
  case hidden
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "PUBLISHED": self = .published
      case "HIDDEN": self = .hidden
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .published: return "PUBLISHED"
      case .hidden: return "HIDDEN"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: CollectionPublished, rhs: CollectionPublished) -> Bool {
    switch (lhs, rhs) {
      case (.published, .published): return true
      case (.hidden, .hidden): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [CollectionPublished] {
    return [
      .published,
      .hidden,
    ]
  }
}

public final class FetchCollectionsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query fetchCollections($first: Int, $productFirst: Int, $after: String, $filter: CollectionFilterInput!, $postalCode: String) {
      collections(first: $first, filter: $filter, postalCode: $postalCode) {
        __typename
        edges {
          __typename
          node {
            __typename
            products(first: $productFirst, after: $after) {
              __typename
              edges {
                __typename
                node {
                  __typename
                  ...productFragment
                }
              }
            }
          }
        }
      }
    }
    """

  public let operationName = "fetchCollections"

  public var queryDocument: String { return operationDefinition.appending(ProductFragment.fragmentDefinition) }

  public var first: Int?
  public var productFirst: Int?
  public var after: String?
  public var filter: CollectionFilterInput
  public var postalCode: String?

  public init(first: Int? = nil, productFirst: Int? = nil, after: String? = nil, filter: CollectionFilterInput, postalCode: String? = nil) {
    self.first = first
    self.productFirst = productFirst
    self.after = after
    self.filter = filter
    self.postalCode = postalCode
  }

  public var variables: GraphQLMap? {
    return ["first": first, "productFirst": productFirst, "after": after, "filter": filter, "postalCode": postalCode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("collections", arguments: ["first": GraphQLVariable("first"), "filter": GraphQLVariable("filter"), "postalCode": GraphQLVariable("postalCode")], type: .object(Collection.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(collections: Collection? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "collections": collections.flatMap { (value: Collection) -> ResultMap in value.resultMap }])
    }

    /// List of the shop's collections.
    public var collections: Collection? {
      get {
        return (resultMap["collections"] as? ResultMap).flatMap { Collection(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "collections")
      }
    }

    public struct Collection: GraphQLSelectionSet {
      public static let possibleTypes = ["CollectionConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]) {
        self.init(unsafeResultMap: ["__typename": "CollectionConnection", "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Contains the nodes in this connection.
      public var edges: [Edge?] {
        get {
          return (resultMap["edges"] as! [ResultMap?]).map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["CollectionEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", type: .object(Node.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "CollectionEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge
        public var node: Node? {
          get {
            return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["Collection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("products", arguments: ["first": GraphQLVariable("productFirst"), "after": GraphQLVariable("after")], type: .object(Product.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(products: Product? = nil) {
            self.init(unsafeResultMap: ["__typename": "Collection", "products": products.flatMap { (value: Product) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// List of products in this collection by cursor.
          public var products: Product? {
            get {
              return (resultMap["products"] as? ResultMap).flatMap { Product(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "products")
            }
          }

          public struct Product: GraphQLSelectionSet {
            public static let possibleTypes = ["ProductCountableConnection"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(edges: [Edge]) {
              self.init(unsafeResultMap: ["__typename": "ProductCountableConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var edges: [Edge] {
              get {
                return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
              }
              set {
                resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
              }
            }

            public struct Edge: GraphQLSelectionSet {
              public static let possibleTypes = ["ProductCountableEdge"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("node", type: .nonNull(.object(Node.selections))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(node: Node) {
                self.init(unsafeResultMap: ["__typename": "ProductCountableEdge", "node": node.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The item at the end of the edge
              public var node: Node {
                get {
                  return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "node")
                }
              }

              public struct Node: GraphQLSelectionSet {
                public static let possibleTypes = ["Product"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLFragmentSpread(ProductFragment.self),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var fragments: Fragments {
                  get {
                    return Fragments(unsafeResultMap: resultMap)
                  }
                  set {
                    resultMap += newValue.resultMap
                  }
                }

                public struct Fragments {
                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public var productFragment: ProductFragment {
                    get {
                      return ProductFragment(unsafeResultMap: resultMap)
                    }
                    set {
                      resultMap += newValue.resultMap
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

public struct ProductFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment productFragment on Product {
      __typename
      id
      name
      searchIndex
      description
      isAvailable
      isPublished
      showPriceWeightUnit
      label
      labelFontColor
      labelBackgroundColor
      weight {
        __typename
        unit
        value
      }
      thumbnail {
        __typename
        url
      }
      images {
        __typename
        url
        sortOrder
      }
      category {
        __typename
        id
        name
      }
      productType {
        __typename
        name
      }
    }
    """

  public static let possibleTypes = ["Product"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("searchIndex", type: .scalar(String.self)),
    GraphQLField("description", type: .nonNull(.scalar(String.self))),
    GraphQLField("isAvailable", type: .scalar(Bool.self)),
    GraphQLField("isPublished", type: .nonNull(.scalar(Bool.self))),
    GraphQLField("showPriceWeightUnit", type: .nonNull(.scalar(Bool.self))),
    GraphQLField("label", type: .scalar(String.self)),
    GraphQLField("labelFontColor", type: .nonNull(.scalar(String.self))),
    GraphQLField("labelBackgroundColor", type: .nonNull(.scalar(String.self))),
    GraphQLField("weight", type: .object(Weight.selections)),
    GraphQLField("thumbnail", type: .object(Thumbnail.selections)),
    GraphQLField("images", type: .list(.object(Image.selections))),
    GraphQLField("category", type: .nonNull(.object(Category.selections))),
    GraphQLField("productType", type: .nonNull(.object(ProductType.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String, searchIndex: String? = nil, description: String, isAvailable: Bool? = nil, isPublished: Bool, showPriceWeightUnit: Bool, label: String? = nil, labelFontColor: String, labelBackgroundColor: String, weight: Weight? = nil, thumbnail: Thumbnail? = nil, images: [Image?]? = nil, category: Category, productType: ProductType) {
    self.init(unsafeResultMap: ["__typename": "Product", "id": id, "name": name, "searchIndex": searchIndex, "description": description, "isAvailable": isAvailable, "isPublished": isPublished, "showPriceWeightUnit": showPriceWeightUnit, "label": label, "labelFontColor": labelFontColor, "labelBackgroundColor": labelBackgroundColor, "weight": weight.flatMap { (value: Weight) -> ResultMap in value.resultMap }, "thumbnail": thumbnail.flatMap { (value: Thumbnail) -> ResultMap in value.resultMap }, "images": images.flatMap { (value: [Image?]) -> [ResultMap?] in value.map { (value: Image?) -> ResultMap? in value.flatMap { (value: Image) -> ResultMap in value.resultMap } } }, "category": category.resultMap, "productType": productType.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The ID of the object.
  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var searchIndex: String? {
    get {
      return resultMap["searchIndex"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "searchIndex")
    }
  }

  public var description: String {
    get {
      return resultMap["description"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "description")
    }
  }

  /// Whether the product is in stock and visible or not.
  public var isAvailable: Bool? {
    get {
      return resultMap["isAvailable"] as? Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "isAvailable")
    }
  }

  public var isPublished: Bool {
    get {
      return resultMap["isPublished"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "isPublished")
    }
  }

  public var showPriceWeightUnit: Bool {
    get {
      return resultMap["showPriceWeightUnit"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "showPriceWeightUnit")
    }
  }

  public var label: String? {
    get {
      return resultMap["label"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "label")
    }
  }

  public var labelFontColor: String {
    get {
      return resultMap["labelFontColor"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "labelFontColor")
    }
  }

  public var labelBackgroundColor: String {
    get {
      return resultMap["labelBackgroundColor"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "labelBackgroundColor")
    }
  }

  public var weight: Weight? {
    get {
      return (resultMap["weight"] as? ResultMap).flatMap { Weight(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "weight")
    }
  }

  /// The main thumbnail for a product.
  public var thumbnail: Thumbnail? {
    get {
      return (resultMap["thumbnail"] as? ResultMap).flatMap { Thumbnail(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "thumbnail")
    }
  }

  /// List of images for the product
  public var images: [Image?]? {
    get {
      return (resultMap["images"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Image?] in value.map { (value: ResultMap?) -> Image? in value.flatMap { (value: ResultMap) -> Image in Image(unsafeResultMap: value) } } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [Image?]) -> [ResultMap?] in value.map { (value: Image?) -> ResultMap? in value.flatMap { (value: Image) -> ResultMap in value.resultMap } } }, forKey: "images")
    }
  }

  public var category: Category {
    get {
      return Category(unsafeResultMap: resultMap["category"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "category")
    }
  }

  public var productType: ProductType {
    get {
      return ProductType(unsafeResultMap: resultMap["productType"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "productType")
    }
  }

  public struct Weight: GraphQLSelectionSet {
    public static let possibleTypes = ["Weight"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("unit", type: .nonNull(.scalar(String.self))),
      GraphQLField("value", type: .nonNull(.scalar(Double.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(unit: String, value: Double) {
      self.init(unsafeResultMap: ["__typename": "Weight", "unit": unit, "value": value])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Weight unit
    public var unit: String {
      get {
        return resultMap["unit"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "unit")
      }
    }

    /// Weight value
    public var value: Double {
      get {
        return resultMap["value"]! as! Double
      }
      set {
        resultMap.updateValue(newValue, forKey: "value")
      }
    }
  }

  public struct Thumbnail: GraphQLSelectionSet {
    public static let possibleTypes = ["Image"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("url", type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(url: String) {
      self.init(unsafeResultMap: ["__typename": "Image", "url": url])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The URL of the image.
    public var url: String {
      get {
        return resultMap["url"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "url")
      }
    }
  }

  public struct Image: GraphQLSelectionSet {
    public static let possibleTypes = ["ProductImage"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("url", type: .nonNull(.scalar(String.self))),
      GraphQLField("sortOrder", type: .nonNull(.scalar(Int.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(url: String, sortOrder: Int) {
      self.init(unsafeResultMap: ["__typename": "ProductImage", "url": url, "sortOrder": sortOrder])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The URL of the image.
    public var url: String {
      get {
        return resultMap["url"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "url")
      }
    }

    public var sortOrder: Int {
      get {
        return resultMap["sortOrder"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "sortOrder")
      }
    }
  }

  public struct Category: GraphQLSelectionSet {
    public static let possibleTypes = ["Category"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, name: String) {
      self.init(unsafeResultMap: ["__typename": "Category", "id": id, "name": name])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The ID of the object.
    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String {
      get {
        return resultMap["name"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }
  }

  public struct ProductType: GraphQLSelectionSet {
    public static let possibleTypes = ["ProductType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(name: String) {
      self.init(unsafeResultMap: ["__typename": "ProductType", "name": name])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var name: String {
      get {
        return resultMap["name"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }
  }
}
