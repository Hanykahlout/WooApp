/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

struct Line_items : Mappable {
	var id : Int?
	var name : String?
	var product_id : Int?
	var variation_id : Int?
	var quantity : Int?
	var tax_class : String?
	var subtotal : String?
	var subtotal_tax : String?
	var total : String?
	var total_tax : String?
	var taxes : [Taxes]?
	var meta_data : [String]?
	var sku : String?
	var price : Int?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		name <- map["name"]
		product_id <- map["product_id"]
		variation_id <- map["variation_id"]
		quantity <- map["quantity"]
		tax_class <- map["tax_class"]
		subtotal <- map["subtotal"]
		subtotal_tax <- map["subtotal_tax"]
		total <- map["total"]
		total_tax <- map["total_tax"]
		taxes <- map["taxes"]
		meta_data <- map["meta_data"]
		sku <- map["sku"]
		price <- map["price"]
	}

}