require 'spec_helper'

describe "trips" do
  describe "listing trips" do
    before do
      @trip1 = Factory.create(:trip, name: "Trip to New York", date: Date.today)
      @trip2 = Factory.create(:trip, name: "Trip to San Francisco", date: Date.today)
      visit "/trips"
    end

    it "should list as many trips as we have" do
      page.all('ul li').should have(2).trips
    end

    it "should list all trip names (xpath)" do
      page.should have_xpath("//li[.='#{@trip1.name}']")
      page.should have_xpath("//li[.='#{@trip2.name}']")
    end

    it "should list all trip names (css)" do
      trip_names = page.all('ul li').map(&:text)
      trip_names.should include(@trip1.name)
      trip_names.should include(@trip2.name)
    end

    describe "when clicking on a link" do
      before do
        click_link(@trip1.name)
      end

      it "should show detailed information for our trip" do
        page.should have_xpath("//h1[.='#{@trip1.name}']")
      end
    end

  end
end
