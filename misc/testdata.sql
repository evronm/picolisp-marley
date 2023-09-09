
delete from users;
delete from services;
delete from itineraries;
delete from itineraries_services;

insert into users values (null, "user", "pw", "email", "phone", "address", "zip", null);
insert into users values (null, "vendor", "pw", "emailv", "phonev", "address", "zip", "v");
insert into users values (null, "provider", "pw", "emailp", "phonep", "address", "zip", "p");
insert into services values (null, 2, "service1 name", "service 1 description ", 90, 10, 6, 20000, "usd");
insert into itineraries values (null, 1, 4, 3, "20240101 - 10:00AM");
insert into itineraries_services values (null, 1, 1, "10:30AM");
