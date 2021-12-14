/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper
import RealmSwift

struct AllOrders : Mappable{
	var id : Int?
	var parent_id : Int?
	var number : String?
	var order_key : String?
	var created_via : String?
	var version : String?
	var status : String?
	var currency : String?
	var date_created : String?
	var date_created_gmt : String?
	var date_modified : String?
	var date_modified_gmt : String?
	var discount_total : String?
	var discount_tax : String?
	var shipping_total : String?
	var shipping_tax : String?
	var cart_tax : String?
	var total : String?
	var total_tax : String?
	var prices_include_tax : Bool?
	var customer_id : Int?
	var customer_ip_address : String?
	var customer_user_agent : String?
	var customer_note : String?
	var billing : Billing?
	var shipping : Shipping?
	var payment_method : String?
	var payment_method_title : String?
	var transaction_id : String?
	var date_paid : String?
	var date_paid_gmt : String?
	var date_completed : String?
	var date_completed_gmt : String?
	var cart_hash : String?
	var meta_data : [Meta_data]?
	var line_items : [Line_items]?
	var tax_lines : [Tax_lines]?
	var shipping_lines : [Shipping_lines]?
	var fee_lines : [String]?
	var coupon_lines : [String]?
	var refunds : [String]?
	var _links : _links?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		parent_id <- map["parent_id"]
		number <- map["number"]
		order_key <- map["order_key"]
		created_via <- map["created_via"]
		version <- map["version"]
		status <- map["status"]
		currency <- map["currency"]
		date_created <- map["date_created"]
		date_created_gmt <- map["date_created_gmt"]
		date_modified <- map["date_modified"]
		date_modified_gmt <- map["date_modified_gmt"]
		discount_total <- map["discount_total"]
		discount_tax <- map["discount_tax"]
		shipping_total <- map["shipping_total"]
		shipping_tax <- map["shipping_tax"]
		cart_tax <- map["cart_tax"]
		total <- map["total"]
		total_tax <- map["total_tax"]
		prices_include_tax <- map["prices_include_tax"]
		customer_id <- map["customer_id"]
		customer_ip_address <- map["customer_ip_address"]
		customer_user_agent <- map["customer_user_agent"]
		customer_note <- map["customer_note"]
		billing <- map["billing"]
		shipping <- map["shipping"]
		payment_method <- map["payment_method"]
		payment_method_title <- map["payment_method_title"]
		transaction_id <- map["transaction_id"]
		date_paid <- map["date_paid"]
		date_paid_gmt <- map["date_paid_gmt"]
		date_completed <- map["date_completed"]
		date_completed_gmt <- map["date_completed_gmt"]
		cart_hash <- map["cart_hash"]
		meta_data <- map["meta_data"]
		line_items <- map["line_items"]
		tax_lines <- map["tax_lines"]
		shipping_lines <- map["shipping_lines"]
		fee_lines <- map["fee_lines"]
		coupon_lines <- map["coupon_lines"]
		refunds <- map["refunds"]
		_links <- map["_links"]
	}

}
