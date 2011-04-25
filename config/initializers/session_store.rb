# Be sure to restart your server when you modify this file.

Sniphr::Application.config.session_store :cookie_store, :key => '_sniphr_session'

ActionController::Base.session_options[:session_expires] = 3.years.from_now

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Sniphr::Application.config.session_store :active_record_store
