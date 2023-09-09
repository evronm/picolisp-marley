
create table users (id integer primary key, name text, pw password, email text unique, phone text, address text, zip text, type text);
create table services (id integer primary key, vendor_id integer, name text, description text, duration integer, capacity integer, max_group_size integer, price currency, currency text);
create table itineraries (id integer primary key, user_id, ppl integer, provider_id, start datetime);
create table itineraries_services (id integer primary key, itinerary_id integer, service_id, start time);
