# Reviewer

This is just the start. One day this will be the :hearts: of a Swift based Endpoint that given the text will spit back some interesting stuff about the text given to the endpoint. A specific example would be to pass in a [Shopify](https://www.shopify.com) App Review for one of [Bold's](https://www.boldcommerce.com) apps, and return some interesting information about that reivew, like people named, orginizations named, or places named.

_Current Issues_
- Only works for MacOS 10.13
	- Not certain as to why, I believe it to be the version of the NSLinguisticTagger API, but again not certain 

- Limited in what it can find
	- Current implementation only allows for [.personalName, .placeName, .organizationName] to be found.
	- Additional feature will be added that allow someone to know if a give review is Postive or Negative

