/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

struct AllProducts : Mappable {
	var id : Int?
	var name : String?
	var slug : String?
	var permalink : String?
	var date_created : String?
	var date_created_gmt : String?
	var date_modified : String?
	var date_modified_gmt : String?
	var type : String?
	var status : String?
	var featured : Bool?
	var catalog_visibility : String?
	var description : String?
	var short_description : String?
	var sku : String?
	var price : String?
	var regular_price : String?
	var sale_price : String?
	var date_on_sale_from : String?
	var date_on_sale_from_gmt : String?
	var date_on_sale_to : String?
	var date_on_sale_to_gmt : String?
	var price_html : String?
	var on_sale : Bool?
	var purchasable : Bool?
	var total_sales : Int?
	var virtual : Bool?
	var downloadable : Bool?
	var downloads : [String]?
	var download_limit : Int?
	var download_expiry : Int?
	var external_url : String?
	var button_text : String?
	var tax_status : String?
	var tax_class : String?
	var manage_stock : Bool?
	var stock_quantity : String?
	var stock_status : String?
	var backorders : String?
	var backorders_allowed : Bool?
	var backordered : Bool?
	var sold_individually : Bool?
	var weight : String?
	var dimensions : Dimensions?
	var shipping_required : Bool?
	var shipping_taxable : Bool?
	var shipping_class : String?
	var shipping_class_id : Int?
	var reviews_allowed : Bool?
	var average_rating : String?
	var rating_count : Int?
	var related_ids : [Int]?
	var upsell_ids : [String]?
	var cross_sell_ids : [String]?
	var parent_id : Int?
	var purchase_note : String?
	var categories : [Categories]?
	var tags : [String]?
	var images : [Images]?
	var attributes : [Attributes]?
	var default_attributes : [String]?
	var variations : [Int]?
	var grouped_products : [String]?
	var menu_order : Int?
	var meta_data : [String]?
	var _links : _links?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		name <- map["name"]
		slug <- map["slug"]
		permalink <- map["permalink"]
		date_created <- map["date_created"]
		date_created_gmt <- map["date_created_gmt"]
		date_modified <- map["date_modified"]
		date_modified_gmt <- map["date_modified_gmt"]
		type <- map["type"]
		status <- map["status"]
		featured <- map["featured"]
		catalog_visibility <- map["catalog_visibility"]
		description <- map["description"]
		short_description <- map["short_description"]
		sku <- map["sku"]
		price <- map["price"]
		regular_price <- map["regular_price"]
		sale_price <- map["sale_price"]
		date_on_sale_from <- map["date_on_sale_from"]
		date_on_sale_from_gmt <- map["date_on_sale_from_gmt"]
		date_on_sale_to <- map["date_on_sale_to"]
		date_on_sale_to_gmt <- map["date_on_sale_to_gmt"]
		price_html <- map["price_html"]
		on_sale <- map["on_sale"]
		purchasable <- map["purchasable"]
		total_sales <- map["total_sales"]
		virtual <- map["virtual"]
		downloadable <- map["downloadable"]
		downloads <- map["downloads"]
		download_limit <- map["download_limit"]
		download_expiry <- map["download_expiry"]
		external_url <- map["external_url"]
		button_text <- map["button_text"]
		tax_status <- map["tax_status"]
		tax_class <- map["tax_class"]
		manage_stock <- map["manage_stock"]
		stock_quantity <- map["stock_quantity"]
		stock_status <- map["stock_status"]
		backorders <- map["backorders"]
		backorders_allowed <- map["backorders_allowed"]
		backordered <- map["backordered"]
		sold_individually <- map["sold_individually"]
		weight <- map["weight"]
		dimensions <- map["dimensions"]
		shipping_required <- map["shipping_required"]
		shipping_taxable <- map["shipping_taxable"]
		shipping_class <- map["shipping_class"]
		shipping_class_id <- map["shipping_class_id"]
		reviews_allowed <- map["reviews_allowed"]
		average_rating <- map["average_rating"]
		rating_count <- map["rating_count"]
		related_ids <- map["related_ids"]
		upsell_ids <- map["upsell_ids"]
		cross_sell_ids <- map["cross_sell_ids"]
		parent_id <- map["parent_id"]
		purchase_note <- map["purchase_note"]
		categories <- map["categories"]
		tags <- map["tags"]
		images <- map["images"]
		attributes <- map["attributes"]
		default_attributes <- map["default_attributes"]
		variations <- map["variations"]
		grouped_products <- map["grouped_products"]
		menu_order <- map["menu_order"]
		meta_data <- map["meta_data"]
		_links <- map["_links"]
	}

}
