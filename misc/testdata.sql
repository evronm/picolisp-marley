
delete from users;
delete from services;
delete from itineraries;
delete from itineraries_services;

insert into users values (null, "last", "first_name", "email", "phone", "address", "zip", null);
insert into users values (null, "last", "first_name", "email1", "phone", "address", "zip", "v");
insert into users values (null, "last", "first_name", "email2", "phone", "address", "zip", "p");
insert into services values (null, 2, "service1 name", "service 1 description ", 90, 200);
insert into itineraries values (null, 1, 3, "20240101 - 10:00AM");
insert into itineraries_services values (null, 1, 1, "10:30AM");
