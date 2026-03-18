require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Reload code on every request (good for development)
  config.enable_reloading = true

  # Do not eager load code on boot
  config.eager_load = false

  # Show full error reports
  config.consider_all_requests_local = true

  # Enable server timing
  config.server_timing = true

  # Enable caching toggle
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
    config.public_file_server.headers = {
      "cache-control" => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
  end

  # Store uploaded files locally
  config.active_storage.service = :local

  # Don't raise if mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Don't cache mailer views
  config.action_mailer.perform_caching = false

  # Print deprecation notices
  config.active_support.deprecation = :log

  # Raise errors for disallowed deprecations
  config.active_support.disallowed_deprecation = :raise

  # Log disallowed deprecations
  config.active_support.disallowed_deprecation_warnings = []

  # Raise error if there are pending migrations
  config.active_record.migration_error = :page_load

  # Highlight code in logs
  config.active_record.verbose_query_logs = true

  # Suppress logger output for asset requests
  config.assets.quiet = true

  # Annotate rendered views with file names
  config.action_view.annotate_rendered_view_with_filenames = true

  # Raise error for missing translations
  # config.i18n.raise_on_missing_translations = true
end
