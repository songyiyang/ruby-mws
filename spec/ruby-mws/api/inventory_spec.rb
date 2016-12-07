require 'spec_helper'

describe RubyMWS::API::Inventory do

  before :all do
    EphemeralResponse.activate
    @mws = RubyMWS.new(auth_params)
  end

  context "requests" do

    describe "list_inventory_supply" do
      it "should return items based on seller SKUs" do
        items = @mws.inventory.list_inventory_supply :timestamp => timestamp,
          :seller_skus => %w[PF-5VZN-04XR V4-03EY-LAL1 OC-TUKC-031P]
        items.should have_key :inventory_supply_list
        items.inventory_supply_list.should be_an_instance_of Array
      end

      it "should return items with inventory changes since a certain time" do
        items = @mws.inventory.list_inventory_supply :timestamp => timestamp,
          :query_start_date_time => "2012-01-15T10:04:01-05:00"
        items.should have_key :inventory_supply_list
        items.inventory_supply_list.should be_an_instance_of Array
      end
    end
  end

end