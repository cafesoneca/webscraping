require 'web_scraping'


describe WebScraping do
  describe 'car shopper' do
    context 'create a car list for cars above $30000 ' do
      it 'returns 3 cars' do   
        list =  WebScraping.car_shopper(30000)
        
        expect(list.count).to eq(3)
      end
    end
    
    context 'create a list for cars with rating above 4' do
      it 'return 2 cars' do   
      end
    end
  end
end
