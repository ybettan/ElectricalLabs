
data = {
        "country abbreviation": "US",
        "places": [
            {    
                "place name": "Belmont_zone_a",
                "longitude": "-71.4594",
                "post code": "02178",
                "latitude": "42.4464"
            },
            {
                "place name": "Belmont_zone_b",
                "longitude": "-71.6055",
                "post code": "02678",
                "latitude": "42.4822"
            },
            {
                "place name": "Belmont_zone_c",
                "longitude": "-71.2044",
                "post code": "02478",
                "latitude": "42.4128"
            }
        ],
        "country": "United States",
        "place name": "Belmont",
        "state": "Massachusetts",
        "state abbreviation": "MA"
       }

for i in range(3):
    place = data["places"][i]["place name"]
    longitude = data["places"][i]["longitude"]
    print "longitude of {} is {}".format(place, longitude)
