

function locations(app) {

    //GET LOCATION
    app.get('/location', (req, res) => {
        var location = req.param('location');
        
            console.log('location is in getLocationsId: ' + location)

            var request = require("request");
            var options = {
              method: 'GET',
              url: 'https://tripadvisor1.p.rapidapi.com/locations/search',
              qs: {
                location_id: '1',
                limit: '30',
                sort: 'relevance',
                offset: '0',
                lang: 'en_US',
                currency: 'USD',
                units: 'km',
                query: location

              },
              headers: {
                "x-rapidapi-host": "",
                "x-rapidapi-key": "",
                "useQueryString": true
              }
            };
            request(options, function (error, response, body) {
                if (error) throw new Error(error);
                    var data = JSON.parse(body)
                    var locationId = data.data[0].result_object.location_id;

                    // Getting the attractions for the location

                    var options_for_loc = {
                      method: 'GET',
                      url: 'https://tripadvisor1.p.rapidapi.com/attractions/list',
                      qs: {
                        lang: 'en_US',
                        currency: 'USD',
                        sort: 'recommended',
                        lunit: 'km',
                        limit: '30',
                        bookable_first: 'false',
                        subcategory: '36',
                        location_id: locationId
                      },
                      headers: {
                        "x-rapidapi-host": "",
                        "x-rapidapi-key": "",
                        "useQueryString": true
                      }
                    };

                    console.log("locationId is: " + locationId)

                    request(options_for_loc, function (error, response, body) {
                    	if (error) throw new Error(error);
                        var attractions_data = JSON.parse(body);
                        var attractions = [1,2,3,4,5];
                        for (i=0; i<5; i++) {
                            attractions[i] = [attractions_data.data[i].name, attractions_data.data[i].description, attractions_data.data[i].web_url];
                        }

                        attraction_one_name = attractions[0][0];
                        attraction_one_description = attractions[0][1];
                        attraction_one_url = attractions[0][2];

                        attraction_two_name = attractions[1][0];
                        attraction_two_description = attractions[1][1];
                        attraction_two_url = attractions[1][2];

                        attraction_three_name = attractions[2][0];
                        attraction_three_description = attractions[2][1];
                        attraction_three_url = attractions[2][2];

                        attraction_four_name = attractions[3][0];
                        attraction_four_description = attractions[3][1];
                        attraction_four_url = attractions[3][2];

                        attraction_five_name = attractions[4][0];
                        attraction_five_description = attractions[4][1];
                        attraction_five_url = attractions[4][2];

                       
                    });
            });
        })
            
    }

module.exports = locations