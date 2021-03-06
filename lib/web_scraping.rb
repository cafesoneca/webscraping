class WebScraping
  require 'httparty'
  require 'nokogiri'
  require 'pp'

  def self.convert_price(price)
    price.gsub('$','').gsub(',','').to_i
  end

  def self.car_shopper(price)
    response = HTTParty.get('https://code.evgenyrahman.com/rubycourse/carlist.html')
    parsed_html = Nokogiri::HTML(response.body)
    
    car_listing = parsed_html.css('.card.car')

    cars = car_listing.map do |each_car|
      {
        make: each_car.css('.make').text,
        year: each_car.css('.year').text,
        price: convert_price(each_car.css('.price').text),
        rating: each_car.css('.star.rating').attribute("data-rating").value.to_i
      }
    end

    cars.select! do |car|
      (car[:price] > price)
    end
    
    cars = cars.to_a
  end  

  def self.save_file
    cars = WebScraping.car_shopper(30000)
    File.open("car_listings.json", "wb") do |f|
      f << cars.to_json
    end
  
    puts "Results were written to file!"
  end


end
