module ApplicationHelper
  def tweet_button
    '<a href="http://twitter.com/share" class="twitter-share-button" data-text="I am taking the Zero to Rails 3 Course right now #eyu" data-count="horizontal" data-url="http://www.engineyard.com/university" data-via="eyuniversity">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>'.html_safe
  end
end
