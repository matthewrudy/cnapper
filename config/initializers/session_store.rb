# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cnapper_session',
  :secret      => 'd55d9553ec4925b68260d90294a990d79200cf8359725db6fc699ff6cff847821d75c792ef8ab17b0621d77589ce61abec5c6861cc501b1d2a6ad55a567359b5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
