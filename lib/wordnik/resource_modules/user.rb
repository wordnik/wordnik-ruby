module UserMethods

  def get_word_of_the_day_by_date(username, date, *args)
    # HTTP Method
    http_method = :get

    # Path
    path = '/user/{username}/wordOfTheDay/{date}'
    path.sub!('{username}', username)

    path.sub!('{date}', date)

    # args
    last_arg = args.pop if args.last.is_a?(Hash)
    last_arg = args.pop if args.last.is_a?(Array)
    last_arg ||= {}

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

  def get_word_of_the_day_list(username, *args)
    # HTTP Method
    http_method = :get

    # Path
    path = '/user/{username}/wordOfTheDayList'
    path.sub!('{username}', username)

    # args
    last_arg = args.pop if args.last.is_a?(Hash)
    last_arg = args.pop if args.last.is_a?(Array)
    last_arg ||= {}

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

  def update_word_of_the_day_list(username, *args)
    # HTTP Method
    http_method = :put

    # Path
    path = '/user/{username}/wordOfTheDayList'
    path.sub!('{username}', username)

    # args
    last_arg = args.pop if args.last.is_a?(Hash)
    last_arg = args.pop if args.last.is_a?(Array)
    last_arg ||= {}

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

  def create_word_of_the_day_list(username, *args)
    # HTTP Method
    http_method = :post

    # Path
    path = '/user/{username}/wordOfTheDayList'
    path.sub!('{username}', username)

    # args
    last_arg = args.pop if args.last.is_a?(Hash)
    last_arg = args.pop if args.last.is_a?(Array)
    last_arg ||= {}

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

  def update_item_in_word_of_the_day_list(username, permalink, *args)
    # HTTP Method
    http_method = :put

    # Path
    path = '/user/{username}/wordOfTheDayList/{permalink}'
    path.sub!('{username}', username)

    path.sub!('{permalink}', permalink)

    # args
    last_arg = args.pop if args.last.is_a?(Hash)
    last_arg = args.pop if args.last.is_a?(Array)
    last_arg ||= {}

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

  def update_word_of_the_day_list(username, permalink, *args)
    # HTTP Method
    http_method = :delete

    # Path
    path = '/user/{username}/wordOfTheDayList/{permalink}'
    path.sub!('{username}', username)

    path.sub!('{permalink}', permalink)

    # args
    last_arg = args.pop if args.last.is_a?(Hash)
    last_arg = args.pop if args.last.is_a?(Array)
    last_arg ||= {}

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

  def delete_word_from_word_of_the_day_list(username, permalink, wordToDelete, *args)
    # HTTP Method
    http_method = :delete

    # Path
    path = '/user/{username}/wordOfTheDayList/{permalink}/{wordToDelete}'
    path.sub!('{username}', username)

    path.sub!('{permalink}', permalink)

    path.sub!('{wordToDelete}', wordToDelete)

    # args
    last_arg = args.pop if args.last.is_a?(Hash)
    last_arg = args.pop if args.last.is_a?(Array)
    last_arg ||= {}

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

  def add_word_to_word_of_the_day_list(username, permalink, *args)
    # HTTP Method
    http_method = :put

    # Path
    path = '/user/{username}/wordOfTheDayList/{permalink}/add'
    path.sub!('{username}', username)

    path.sub!('{permalink}', permalink)

    # args
    last_arg = args.pop if args.last.is_a?(Hash)
    last_arg = args.pop if args.last.is_a?(Array)
    last_arg ||= {}

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