/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

struct AllCustomers : Mappable {
	var id : Int?
	var date_created : String?
	var date_created_gmt : String?
	var date_modified : String?
	var date_modified_gmt : String?
	var email : String?
	var first_name : String?
	var last_name : String?
	var role : String?
	var username : String?
	var billing : Billing?
	var shipping : Shipping?
	var is_paying_customer : Bool?
	var avatar_url : String?
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
		email <- map["email"]
		first_name <- map["first_name"]
		last_name <- map["last_name"]
		role <- map["role"]
		username <- map["username"]
		billing <- map["billing"]
		shipping <- map["shipping"]
		is_paying_customer <- map["is_paying_customer"]
		avatar_url <- map["avatar_url"]
		meta_data <- map["meta_data"]
		_links <- map["_links"]
	}

}
