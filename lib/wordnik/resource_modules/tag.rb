# HEY HACKER! THIS IS AN AUTO-GENERATED FILE.
# So don't bother editing it. To see how it's built, take a look at the Rakefile

module TagMethods

  # Returns information about API parameters
  #
  def get_help(*args)
    http_method = :get
    path = '/tag'

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

  # Fetches Words with a specific Tag.
  #
  def get_words_tagged(tag, *args)
    http_method = :get
    path = '/tag/{tag}/word'
    path.sub!('{tag}', tag)

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