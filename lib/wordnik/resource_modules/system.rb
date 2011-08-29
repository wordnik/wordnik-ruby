# HEY HACKER! THIS IS AN AUTO-GENERATED FILE.
# So don't bother editing it. To see how it's built, take a look at the Rakefile

module SystemMethods

  # Returns all defined ContentProviders.
  #
  def get_providers(*args)
    http_method = :get
    path = '/system/providers'

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

  # Returns system-wide statistics for the platform.
  #
  def get_stats(*args)
    http_method = :get
    path = '/system/stats'

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

  # Returns weighted terms related to the input word
  #
  def get_related_words(word, *args)
    http_method = :get
    path = '/system/{word}/related'
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

  # Returns a word with attributes
  #
  def get_related_words(word, *args)
    http_method = :get
    path = '/system/{word}'
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

  # Returns a graph response for the supplied terms
  #
  def get_word_by_id(*args)
    http_method = :get
    path = '/system/graph'

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

  # Gets an Audio File ID for recording.
  #
  def get_audio_record_id(*args)
    http_method = :get
    path = '/system/audioRecordId'

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

  # Sets duration of an Audio File
  #
  def set_audio_duration(audioFileId, duration, *args)
    http_method = :post
    path = '/system/audioDuration'
    path.sub!('{audioFileId}', audioFileId.to_s)
    path.sub!('{duration}', duration.to_s)

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