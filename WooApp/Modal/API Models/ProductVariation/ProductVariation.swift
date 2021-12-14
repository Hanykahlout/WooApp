/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

struct ProductVariation : Mappable {
	var id : Int?
	var date_created : String?
	var date_created_gmt : String?
	var date_modified : String?
	var date_modified_gmt : String?
	var description : String?
	var permalink : String?
	var sku : String?
	var price : String?
	var regular_price : String?
	var sale_price : String?
	var date_on_sale_from : String?
	var date_on_sale_from_gmt : String?
	var date_on_sale_to : String?
	var date_on_sale_to_gmt : String?
	var on_sale : Bool?
	var status : String?
	var purchasable : Bool?
	var virtual : Bool?
	var downloadable : Bool?
	var downloads : [String]?
	var download_limit : Int?
	var download_expiry : Int?
	var tax_status : String?
	var tax_class : String?
	var manage_stock : Bool?
	var stock_quantity : Int?
	var stock_status : String?
	var backorders : String?
	var backorders_allowed : Bool?
	var backordered : Bool?
	var low_stock_amount : String?
	var weight : String?
	var dimensions : Dimensions?
	var shipping_class : String?
	var shipping_class_id : Int?
	var image : Image?
	var attributes : [Attributes]?
	var menu_order : Int?
	var meta_data : [String]?
	var _links : _links?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		date_created <- map["date_created"]
		date_created_gmt <- map["date_created_gmt"]
		date_modified <- map["date_modified"]
		date_modified_gmt <- map["date_modified_gmt"]
		description <- map["description"]
		permalink <- map["permalink"]
		sku <- map["sku"]
		price <- map["price"]
		regular_price <- map["regular_price"]
		sale_price <- map["sale_price"]
		date_on_sale_from <- map["date_on_sale_from"]
		date_on_sale_from_gmt <- map["date_on_sale_from_gmt"]
		date_on_sale_to <- map["date_on_sale_to"]
		date_on_sale_to_gmt <- map["date_on_sale_to_gmt"]
		on_sale <- map["on_sale"]
		status <- map["status"]
		purchasable <- map["purchasable"]
		virtual <- map["virtual"]
		downloadable <- map["downloadable"]
		downloads <- map["downloads"]
		download_limit <- map["download_limit"]
		download_expiry <- map["download_expiry"]
		tax_status <- map["tax_status"]
		tax_class <- map["tax_class"]
		manage_stock <- map["manage_stock"]
		stock_quantity <- map["stock_quantity"]
		stock_status <- map["stock_status"]
		backorders <- map["backorders"]
		backorders_allowed <- map["backorders_allowed"]
		backordered <- map["backordered"]
		low_stock_amount <- map["low_stock_amount"]
		weight <- map["weight"]
		dimensions <- map["dimensions"]
		shipping_class <- map["shipping_class"]
		shipping_class_id <- map["shipping_class_id"]
		image <- map["image"]
		attributes <- map["attributes"]
		menu_order <- map["menu_order"]
		meta_data <- map["meta_data"]
		_links <- map["_links"]
	}

}
