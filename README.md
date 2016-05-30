# BookingBugApi

This is an example API handler gem for [BookingBug APIs](http://dev.bookingbug.com/)

## Question 4
1. Clone this repository to your local disk and enter the folder
2. Enter the irb of this gem:
```ruby
> bin/console
```

3. Print the last 2 names of the service list
```ruby
irb(main):001:0> BookingBugApi.print_q4
```

4. Result preview
```ruby
Last 2 names of 6 services are:
Cookery Classes
Breadmaking
=> [{"id"=>25057, "name"=>"Cookery Classes", "description"=>"All classes are included at this price.", "durations"=>[60], "prices"=>[0], "detail_group_id"=>13402, "booking_time_step"=>60, "is_event_group"=>true, "type"=>"service", "deleted"=>false, "company_id"=>114784, "duration_unit"=>"minute", "min_advance_period"=>0, "max_advance_period"=>5184000, "min_cancel_period"=>86400, "booking_type_public"=>"booking", "min_bookings"=>1, "max_bookings"=>1, "order"=>25057, "child_level_service"=>true, "_links"=>{"self"=>{"href"=>"https://us.bookingbug.com/api/v1/114784/services/25057"}, "items"=>{"href"=>"https://us.bookingbug.com/api/v1/114784/items?service_id=25057"}, "questions"=>{"href"=>"https://us.bookingbug.com/api/v1/114784/questions?detail_group_id=13402"}, "days"=>{"href"=>"https://us.bookingbug.com/api/v1/114784/day_data?service_id=25057{&month,week,date,edate,location,event_id,person_id,resource_id}", "templated"=>true}, "times"=>{"href"=>"https://us.bookingbug.com/api/v1/114784/time_data?service_id=25057{&event_id,date,end_date,location,person_id,resource_id,duration,single,num_resources,group_id,resource_ids}", "templated"=>true}, "book"=>{"href"=>"https://us.bookingbug.com/api/v1/114784/basket/add_item?service_id=25057{&event_id,member_id,event_chain_id,product_id,attachment_id,deal_id,package_id,bulk_purchase_id}", "templated"=>true}, "all_children"=>{"href"=>"https://us.bookingbug.com/api/v1/114784/services/25057/all_children"}, "company"=>{"href"=>"https://us.bookingbug.com/api/v1/company/114784"}}}, {"id"=>33829, "name"=>"Breadmaking", "durations"=>[60], "prices"=>[0], "detail_group_id"=>13402, "booking_time_step"=>60, "is_event_group"=>true, "type"=>"service", "deleted"=>false, "company_id"=>114784, "duration_unit"=>"minute", "min_advance_period"=>0, "max_advance_period"=>5184000, "min_cancel_period"=>86400, "booking_type_public"=>"booking", "min_bookings"=>1, "max_bookings"=>1, "order"=>323, "child_level_service"=>true, "_links"=>{"self"=>{"href"=>"https://us.bookingbug.com/api/v1/114784/services/33829"}, "items"=>{"href"=>"https://us.bookingbug.com/api/v1/114784/items?service_id=33829"}, "questions"=>{"href"=>"https://us.bookingbug.com/api/v1/114784/questions?detail_group_id=13402"}, "days"=>{"href"=>"https://us.bookingbug.com/api/v1/114784/day_data?service_id=33829{&month,week,date,edate,location,event_id,person_id,resource_id}", "templated"=>true}, "times"=>{"href"=>"https://us.bookingbug.com/api/v1/114784/time_data?service_id=33829{&event_id,date,end_date,location,person_id,resource_id,duration,single,num_resources,group_id,resource_ids}", "templated"=>true}, "book"=>{"href"=>"https://us.bookingbug.com/api/v1/114784/basket/add_item?service_id=33829{&event_id,member_id,event_chain_id,product_id,attachment_id,deal_id,package_id,bulk_purchase_id}", "templated"=>true}, "all_children"=>{"href"=>"https://us.bookingbug.com/api/v1/114784/services/33829/all_children"}, "company"=>{"href"=>"https://us.bookingbug.com/api/v1/company/114784"}}}]
```

## Test
```ruby
> rspec

BookingBugApi::ApiHandler
  #get
    when correct API endpoint with authorised App-Id
      should not be empty
      should not eq "{\"error\":\"401 Unauthorized\"}"
      should not eq "{\"error\":\"Not Found\"}"
    when correct API endpoint with UNAUTHORISED App-Id
      should not be empty
      should eq "{\"error\":\"401 Unauthorized\"}"
      should not eq "{\"error\":\"Not Found\"}"
    when WRONG API endpoint with authorised App-Id
      should not be empty
      should not eq "{\"error\":\"401 Unauthorized\"}"
      should eq "{\"error\":\"Not Found\"}"
    when WRONG API endpoint with UNAUTHORISED App-Id
      should not be empty
      should eq "{\"error\":\"401 Unauthorized\"}"
      should not eq "{\"error\":\"Not Found\"}"

BookingBugApi
  has a version number
  ::get_services
    should be an Array
    size should be 6
  ::print_q4
    should be 2 services
Last 2 names of 6 services are:
Cookery Classes
Breadmaking
      should equal 2

Finished in 7.02 seconds (files took 0.1992 seconds to load)
16 examples, 0 failures
```