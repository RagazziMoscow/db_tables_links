select * from company
full join trip on company.id_comp = trip.id_comp
full join pass_in_trip on trip.trip_no = pass_in_trip.trip_no
full join passenger on passenger.id_psg = pass_in_trip.id_psg;
