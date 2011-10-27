# HEY HACKER! THIS IS AN AUTO-GENERATED FILE.
# So don't bother editing it. To see how it's built, take a look at the Rakefile

module AnalyticsMethods

  # Returns top hits over a year, month, week, day or hour
  # If no time resolution parameters are passed, it returns top hits for this week. To fetch top hits for a year, pass only the year. To fetch top hits for a month, pass (year and month). To fetch top hits for a week, pass (year and week). To fetch top hits for a day, pass (year, month and day). To fetch top hits for an hour, pass (year, month, day and hour).
  #
  def get_top_hits(*args)
    http_method = :get
    path = '/analytics/top'

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

  # Returns words which were trending on a given week or month
  # If no time resolution parameters are passed, it returns trending hits for this week.
  # To fetch trending hits for a month, pass (year and month). To fetch trending hits for a week, pass (year and week).
  #
  def get_trending_hits(*args)
    http_method = :get
    path = '/analytics/trending'

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

  # Returns hits a word received in a given year, month, week or day
  # If no time resolution parameters are passed, it returns hits the word received this week. To fetch word hits for a year, pass only the year. To fetch word hits for a month, pass (year and month). To fetch word hits for a week, pass (year and week). To fetch word hits for a day, pass (year, month and day)
  #
  def get_word_hits(word, *args)
    http_method = :get
    path = '/analytics/word/{word}'
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