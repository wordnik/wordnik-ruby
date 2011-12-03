# HEY HACKER! THIS IS AN AUTO-GENERATED FILE.
# So don't bother editing it. To see how it's built, take a look at the Rakefile

module GlossaryMethods

  # Fetches a glossary.
  #
  def get_glossary(permalinkId, *args)
    http_method = :get
    path = '/glossary/{permalinkId}'
    path.sub!('{permalinkId}', permalinkId.to_s)

    # Ruby turns all key-value arguments at the end into a single hash
    # e.g. Wordnik.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
    # becomes {:limit => 10, :part_of_speech => 'verb'}
    last_arg = args.pop if args.last.is_a?(Hash)
    last_arg = args.pop if args.last.is_a?(Array)
    last_arg ||= {}

    # Look for a kwarg called :request_only, whose presence indicates
    # that we want the request itself back, not the response body
    if last_arg.is_a?(Hash) && last_arg[:request_only].present?
      request_only = true
      last_arg.delete(:request_only)
    end

    params = last_arg
    body ||= {}
    request = Wordnik::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

  # Updates a Glossary.
  #
  def update_glossary(permalinkId, body, *args)
    http_method = :put
    path = '/glossary/{permalinkId}'
    path.sub!('{permalinkId}', permalinkId.to_s)

    # Ruby turns all key-value arguments at the end into a single hash
    # e.g. Wordnik.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
    # becomes {:limit => 10, :part_of_speech => 'verb'}
    last_arg = args.pop if args.last.is_a?(Hash)
    last_arg = args.pop if args.last.is_a?(Array)
    last_arg ||= {}

    # Look for a kwarg called :request_only, whose presence indicates
    # that we want the request itself back, not the response body
    if last_arg.is_a?(Hash) && last_arg[:request_only].present?
      request_only = true
      last_arg.delete(:request_only)
    end

    params = last_arg
    body ||= {}
    request = Wordnik::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

  # Deletes the Glossary.
  #
  def delete_glossary(permalinkId, *args)
    http_method = :delete
    path = '/glossary/{permalinkId}'
    path.sub!('{permalinkId}', permalinkId.to_s)

    # Ruby turns all key-value arguments at the end into a single hash
    # e.g. Wordnik.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
    # becomes {:limit => 10, :part_of_speech => 'verb'}
    last_arg = args.pop if args.last.is_a?(Hash)
    last_arg = args.pop if args.last.is_a?(Array)
    last_arg ||= {}

    # Look for a kwarg called :request_only, whose presence indicates
    # that we want the request itself back, not the response body
    if last_arg.is_a?(Hash) && last_arg[:request_only].present?
      request_only = true
      last_arg.delete(:request_only)
    end

    params = last_arg
    body ||= {}
    request = Wordnik::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

  # Adds GlossaryEntry objects for the specified Glossary.
  #
  def add_glossary_entry(permalinkId, body, *args)
    http_method = :post
    path = '/glossary/{permalinkId}/entries'
    path.sub!('{permalinkId}', permalinkId.to_s)

    # Ruby turns all key-value arguments at the end into a single hash
    # e.g. Wordnik.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
    # becomes {:limit => 10, :part_of_speech => 'verb'}
    last_arg = args.pop if args.last.is_a?(Hash)
    last_arg = args.pop if args.last.is_a?(Array)
    last_arg ||= {}

    # Look for a kwarg called :request_only, whose presence indicates
    # that we want the request itself back, not the response body
    if last_arg.is_a?(Hash) && last_arg[:request_only].present?
      request_only = true
      last_arg.delete(:request_only)
    end

    params = last_arg
    body ||= {}
    request = Wordnik::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

  # Publishes a Glossary.
  #
  def publish_glossary(permalinkId, *args)
    http_method = :post
    path = '/glossary/{permalinkId}/publish'
    path.sub!('{permalinkId}', permalinkId.to_s)

    # Ruby turns all key-value arguments at the end into a single hash
    # e.g. Wordnik.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
    # becomes {:limit => 10, :part_of_speech => 'verb'}
    last_arg = args.pop if args.last.is_a?(Hash)
    last_arg = args.pop if args.last.is_a?(Array)
    last_arg ||= {}

    # Look for a kwarg called :request_only, whose presence indicates
    # that we want the request itself back, not the response body
    if last_arg.is_a?(Hash) && last_arg[:request_only].present?
      request_only = true
      last_arg.delete(:request_only)
    end

    params = last_arg
    body ||= {}
    request = Wordnik::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

  # Creates a new version of a Glossary.
  #
  def create_version(permalinkId, *args)
    http_method = :post
    path = '/glossary/{permalinkId}/clone'
    path.sub!('{permalinkId}', permalinkId.to_s)

    # Ruby turns all key-value arguments at the end into a single hash
    # e.g. Wordnik.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
    # becomes {:limit => 10, :part_of_speech => 'verb'}
    last_arg = args.pop if args.last.is_a?(Hash)
    last_arg = args.pop if args.last.is_a?(Array)
    last_arg ||= {}

    # Look for a kwarg called :request_only, whose presence indicates
    # that we want the request itself back, not the response body
    if last_arg.is_a?(Hash) && last_arg[:request_only].present?
      request_only = true
      last_arg.delete(:request_only)
    end

    params = last_arg
    body ||= {}
    request = Wordnik::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

  # Removes a GlossaryEntry object from the specified Glossary.
  #
  def delete_glossary_entry(permalinkId, word, *args)
    http_method = :delete
    path = '/glossary/{permalinkId}/entries/{word}'
    path.sub!('{permalinkId}', permalinkId.to_s)
    path.sub!('{word}', word.to_s)

    # Ruby turns all key-value arguments at the end into a single hash
    # e.g. Wordnik.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
    # becomes {:limit => 10, :part_of_speech => 'verb'}
    last_arg = args.pop if args.last.is_a?(Hash)
    last_arg = args.pop if args.last.is_a?(Array)
    last_arg ||= {}

    # Look for a kwarg called :request_only, whose presence indicates
    # that we want the request itself back, not the response body
    if last_arg.is_a?(Hash) && last_arg[:request_only].present?
      request_only = true
      last_arg.delete(:request_only)
    end

    params = last_arg
    body ||= {}
    request = Wordnik::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

  # Removes a GlossaryEntry object from the specified Glossary.
  #
  def delete_glossary_entries(permalinkId, body, *args)
    http_method = :post
    path = '/glossary/{permalinkId}/deleteEntries'
    path.sub!('{permalinkId}', permalinkId.to_s)

    # Ruby turns all key-value arguments at the end into a single hash
    # e.g. Wordnik.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
    # becomes {:limit => 10, :part_of_speech => 'verb'}
    last_arg = args.pop if args.last.is_a?(Hash)
    last_arg = args.pop if args.last.is_a?(Array)
    last_arg ||= {}

    # Look for a kwarg called :request_only, whose presence indicates
    # that we want the request itself back, not the response body
    if last_arg.is_a?(Hash) && last_arg[:request_only].present?
      request_only = true
      last_arg.delete(:request_only)
    end

    params = last_arg
    body ||= {}
    request = Wordnik::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

  # Fetches a random GlossaryEntry object for the specified Glossary.
  #
  def get_random_glossary_entry(permalinkId, *args)
    http_method = :get
    path = '/glossary/{permalinkId}/randomEntry'
    path.sub!('{permalinkId}', permalinkId.to_s)

    # Ruby turns all key-value arguments at the end into a single hash
    # e.g. Wordnik.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
    # becomes {:limit => 10, :part_of_speech => 'verb'}
    last_arg = args.pop if args.last.is_a?(Hash)
    last_arg = args.pop if args.last.is_a?(Array)
    last_arg ||= {}

    # Look for a kwarg called :request_only, whose presence indicates
    # that we want the request itself back, not the response body
    if last_arg.is_a?(Hash) && last_arg[:request_only].present?
      request_only = true
      last_arg.delete(:request_only)
    end

    params = last_arg
    body ||= {}
    request = Wordnik::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

  # Fetches examples for the Glossary entry
  #
  def get_glossary_entry_examples(permalinkId, word, *args)
    http_method = :get
    path = '/glossary/{permalinkId}/entries/{word}/examples'
    path.sub!('{permalinkId}', permalinkId.to_s)
    path.sub!('{word}', word.to_s)

    # Ruby turns all key-value arguments at the end into a single hash
    # e.g. Wordnik.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
    # becomes {:limit => 10, :part_of_speech => 'verb'}
    last_arg = args.pop if args.last.is_a?(Hash)
    last_arg = args.pop if args.last.is_a?(Array)
    last_arg ||= {}

    # Look for a kwarg called :request_only, whose presence indicates
    # that we want the request itself back, not the response body
    if last_arg.is_a?(Hash) && last_arg[:request_only].present?
      request_only = true
      last_arg.delete(:request_only)
    end

    params = last_arg
    body ||= {}
    request = Wordnik::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

end