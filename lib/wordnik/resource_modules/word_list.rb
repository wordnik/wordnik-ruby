# HEY HACKER! THIS IS AN AUTO-GENERATED FILE.
# So don't bother editing it. To see how it's built, take a look at the Rakefile

module WordListMethods

  # Fetches a WordList by ID
  #
  def get_word_list_by_id(wordListId, *args)
    http_method = :get
    path = '/wordList/{wordListId}'
    path.sub!('{wordListId}', wordListId)

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

    if [:post, :put].include?(http_method)
      params = nil
      body = last_arg
    else
      params = last_arg
      body = nil
    end

    request = Wordnik::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

  # Fetches words in a WordList
  #
  def get_word_list_words(wordListId, *args)
    http_method = :get
    path = '/wordList/{wordListId}/words'
    path.sub!('{wordListId}', wordListId)

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

    if [:post, :put].include?(http_method)
      params = nil
      body = last_arg
    else
      params = last_arg
      body = nil
    end

    request = Wordnik::Request.new(http_method, path, :params => params, :body => body)
    
    
    operation = self.operations.find_by_nickname('get_word_list_words')
    response_value_type = operation.response.value_type
    
    Massage(response.body)
    
    
  end

  # Adds words to a WordList
  #
  def add_words_to_word_list(wordListId, *args)
    http_method = :post
    path = '/wordList/{wordListId}/words'
    path.sub!('{wordListId}', wordListId)

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

    if [:post, :put].include?(http_method)
      params = nil
      body = last_arg
    else
      params = last_arg
      body = nil
    end

    request = Wordnik::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

  # Updates an existing WordList
  #
  def update_word_list(wordListId, *args)
    http_method = :put
    path = '/wordList/{wordListId}'
    path.sub!('{wordListId}', wordListId)

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

    if [:post, :put].include?(http_method)
      params = nil
      body = last_arg
    else
      params = last_arg
      body = nil
    end

    request = Wordnik::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

  # Deletes an existing WordList
  #
  def delete_word_list(wordListId, *args)
    http_method = :delete
    path = '/wordList/{wordListId}'
    path.sub!('{wordListId}', wordListId)

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

    if [:post, :put].include?(http_method)
      params = nil
      body = last_arg
    else
      params = last_arg
      body = nil
    end

    request = Wordnik::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

  # Removes words from a WordList
  #
  def delete_words_from_word_list(wordListId, *args)
    http_method = :post
    path = '/wordList/{wordListId}/deleteWords'
    path.sub!('{wordListId}', wordListId)

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

    if [:post, :put].include?(http_method)
      params = nil
      body = last_arg
    else
      params = last_arg
      body = nil
    end

    request = Wordnik::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

end