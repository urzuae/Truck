# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_truck_session',
  :secret      => '76204ef0d186b68f78d292ac9d0798ee058b4affe23856a339d9841747dd4d1129f5f62b3658d4d2b7778df78e82834b3c3219b2f2977a34181a42c4e11b0a28'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
