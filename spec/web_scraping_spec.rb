require 'web_scraping'

body = "
  <body data-gr-c-s-loaded='true'>
    <div class='ui card car'>
      <div class='blurring dimmable image'>
        <div class='ui dimmer transition hidden'>
          <div class='content'>
            <div class='center'>
              <div class='ui inverted button'>See Details</div>
        </div>
      </div>
    </div>
    <img src='images/001-crossover.png'>
  </div>
  <div class='content'>
    <a class='header make'>Speedy Crossover</a>
    <div class='meta'>
      <span class='year'>2017</span>
        </div>
      <div class='ui star rating' data-rating='3'><i class='icon active'></i><i class='icon active'></i><i class='icon active'></i><i class='icon'></i><i class='icon'></i></div>
    <div class='ui right floated price'>$32,899</div>
    </div>
  </div>
</body>
"

describe WebScraping do
  describe 'car shopper' do
    context 'create a car list for cars above $30000 ' do
      it 'returns 1 car' do
        stub_request(:get, "https://code.evgenyrahman.com/rubycourse/carlist.html").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
           }).
         to_return(status: 200, body: body , headers: {})
        
        list =  WebScraping.car_shopper(30000)
        
        expect(list.count).to eq(1)
      end
    end
  end
end
