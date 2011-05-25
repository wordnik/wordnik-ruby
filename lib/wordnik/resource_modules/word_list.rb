# HEY HACKER! THIS IS AN AUTO-GENERATED FILE.
# So don't bother editing it. To see how it's built, take a look at the Rakefile

module WordListMethods

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
    request_only ? request : request.response.body
  end

  # Returns information about API parameters
  #
  def get_help(*args)
    http_method = :get
    path = '/wordList'

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

  # Checks to see if a WordList has been favorited for a user
  #
  def is_favorite_word_list(wordListId, *args)
    http_method = :get
    path = '/wordList/{wordListId}/isFavorite'
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

  # Favorites a WordList for a User
  #
  def favorite_word_list(wordListId, *args)
    http_method = :post
    path = '/wordList/{wordListId}/favorite'
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

  # Unfavorites a WordList for a User
  #
  def un_favorite_word_list(wordListId, *args)
    http_method = :delete
    path = '/wordList/{wordListId}/favorite'
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

  # Fetches Tags on a WordList
  #
  def get_word_list_tags(wordListId, *args)
    http_method = :get
    path = '/wordList/{wordListId}/tags'
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

  # Fetches Tag count on a WordList
  #
  def get_word_list_tag_count(wordListId, *args)
    http_method = :get
    path = '/wordList/{wordListId}/tagCount'
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

  # Adds a Tag on a WordList
  #
  def add_word_list_tag(wordListId, *args)
    http_method = :post
    path = '/wordList/{wordListId}/tag'
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

  # Adds a Tag on a WordList
  #
  def delete_word_list_tag(wordListId, *args)
    http_method = :delete
    path = '/wordList/{wordListId}/tag'
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

  # Fetches comments on a WordList
  #
  def get_word_list_comments(wordListId, *args)
    http_method = :get
    path = '/wordList/{wordListId}/comments'
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

  # Adds a Comment on a WordList
  #
  def add_comment_to_word_list(wordListId, *args)
    http_method = :post
    path = '/wordList/{wordListId}/comment'
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

  # Updates a Comment on a WordList
  #
  def update_comment_on_word_list(wordListId, *args)
    http_method = :put
    path = '/wordList/{wordListId}/comment'
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

  # Fetches a WordList comment by ID
  #
  def get_word_list_comment_by_id(wordListId, commentId, *args)
    http_method = :get
    path = '/wordList/{wordListId}/comment/{commentId}'
    path.sub!('{wordListId}', wordListId)
    path.sub!('{commentId}', commentId)

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

  # Deletes a WordList comment by ID
  #
  def delete_word_list_comment_by_id(wordListId, commentId, *args)
    http_method = :delete
    path = '/wordList/{wordListId}/comment/{commentId}'
    path.sub!('{wordListId}', wordListId)
    path.sub!('{commentId}', commentId)

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

  # Fetches WordList Comment count
  #
  def get_word_list_comment_count(wordListId, *args)
    http_method = :get
    path = '/wordList/{wordListId}/commentCount'
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

  # Gets a count of Words in a WordList
  #
  def get_word_list_words_count(wordListId, *args)
    http_method = :get
    path = '/wordList/{wordListId}/wordsCount'
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