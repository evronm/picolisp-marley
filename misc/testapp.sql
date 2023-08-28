
create table users (id integer primary key, pw password, last_name text, first_name text, email text unique, phone text, address text, zip text, type text);
create table services (id integer primary key, vendor_id integer, name text, description text, duration integer, price currency, currency text);
create table itineraries (id integer primary key, user_id, provider_id, start datetime);
create table itineraries_services (id integer primary key, itinerary_id integer, service_id, start time);
