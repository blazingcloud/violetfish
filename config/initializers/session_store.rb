# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_violetfish_session',
  :secret      => '4139cd2f099695a06a5d48c8f9ecfbe6a21c473945c8dd68a0cba1e6dc4559f862282b1abd3343b3f5b241f3e5d7f857fa67b55996bf6e4375ae44f14e2b65a1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
