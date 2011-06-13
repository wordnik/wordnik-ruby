# HEY HACKER! THIS IS AN AUTO-GENERATED FILE.
# So don't bother editing it. To see how it's built, take a look at the Rakefile

module ContentMethods

  # Finds the documents similar to supplied document
  # Document is not saved in this call, it just returns matched document with score. Higher the score the closer the match
  #
  def find_similar(body, *args)
    http_method = :post
    path = '/content/findSimilar'

    # Ruby turns all key-value arguments at the end into a single hash
    # e.g. Wordrabbit.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
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
    request = Wordrabbit::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

  # Adds or updates document to the system
  # Tags are optional. Update overrides all values with newly supplied values. Use "update" query parameter to override this behavior
  #
  def upload_document(body, *args)
    http_method = :post
    path = '/content'

    # Ruby turns all key-value arguments at the end into a single hash
    # e.g. Wordrabbit.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
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
    request = Wordrabbit::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

  # Returns information about API parameters
  #
  def get_help(*args)
    http_method = :get
    path = '/content'

    # Ruby turns all key-value arguments at the end into a single hash
    # e.g. Wordrabbit.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
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
    request = Wordrabbit::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

  # Tags the supplied document
  # The document is not saved by default.
  #
  def tag_document(body, *args)
    http_method = :post
    path = '/content/tagDocument'

    # Ruby turns all key-value arguments at the end into a single hash
    # e.g. Wordrabbit.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
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
    request = Wordrabbit::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

  # Returns a document by ID
  # by default it doesn't return content of the document, use "content" query parameter to get the document with content.
  #
  def get_document_by_id(id, *args)
    http_method = :get
    path = '/content/id/{id}'
    path.sub!('{id}', id.to_s)

    # Ruby turns all key-value arguments at the end into a single hash
    # e.g. Wordrabbit.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
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
    request = Wordrabbit::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

  # Finds the documents similar to supplied document id
  # Higher the score the closer the match
  #
  def find_similar_by_id(clientDocumentGUID, *args)
    http_method = :get
    path = '/content/findSimilar/{clientDocumentGUID}'
    path.sub!('{clientDocumentGUID}', clientDocumentGUID.to_s)

    # Ruby turns all key-value arguments at the end into a single hash
    # e.g. Wordrabbit.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
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
    request = Wordrabbit::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

  # Finds documents for a given clientId
  # By default, returns 10 documents
  #
  def find_all(*args)
    http_method = :get
    path = '/content/findAll'

    # Ruby turns all key-value arguments at the end into a single hash
    # e.g. Wordrabbit.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
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
    request = Wordrabbit::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

  # Finds documents for a given tag
  # By default, returns 10 documents
  #
  def find_by_tag(tagName, *args)
    http_method = :get
    path = '/content/findByTag/{tagName}'
    path.sub!('{tagName}', tagName.to_s)

    # Ruby turns all key-value arguments at the end into a single hash
    # e.g. Wordrabbit.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
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
    request = Wordrabbit::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

  # Trains the client data
  # This is only used for internal purpose
  #
  def retrain(*args)
    http_method = :post
    path = '/content/retrain'

    # Ruby turns all key-value arguments at the end into a single hash
    # e.g. Wordrabbit.word.get_examples('dingo', :limit => 10, :part_of_speech => 'verb')
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
    request = Wordrabbit::Request.new(http_method, path, :params => params, :body => body)
    request_only ? request : request.response.body
  end

end