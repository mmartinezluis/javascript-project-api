
class Scraper
    def self.random_quote
      random_quote_page = Nokogiri::HTML(open("https://blog.hubspot.com/sales/famous-quotes"))        # Working quotes page without dynamic ads
      random_quote_page.css("#hs_cos_wrapper_post_body p").collect do |i|
        {:body => i.text.split("\"")[1], :author => i.css("em").text.strip}
      end.delete_if {|i| i.values.include? (nil)}.uniq                                                # Array contains a total of 100 qoutes
    end

    def self.authors
      random_authors_page = Nokogiri::HTML(open("https://www.brainyquote.com/authors"))
      random_authors_page.css(".container .bqLn").collect do |i|
        {:name => i.text.gsub("\n",""), :link => "https://www.brainyquotes.com#{i.css("a").attribute("href").value}"}                # The webpage contains a total of 448 authors
      end.uniq
    end
  
    def self.categories
      categories_list_page = Nokogiri::HTML(open("https://www.brainyquote.com/"))
      categories_list_page.css(".homeGridBox #allTopics .bqLn").collect do |i|
        {:name => i.text, :link => "https://www.brainyquotes.com#{i.css("a").attribute("href").value}"}                                                                            # Webpage contains a total of 10 categories. I chose to display 5 categories only.
      end#.select{ |hash| hash[:name] == "Inspirational" || hash[:name] == "Motivational" || hash[:name] == "Life" || hash[:name] == "Wisdom" || hash[:name] == "Attitude"}
    end

    def self.author_quotes(author_link)
      author_quote_page = Nokogiri::HTML(open(author_link))                                                                         #author_quote_page = Nokogiri::HTML(open("https://www.brainyquote.com//authors/martin-luther-king-jr-quotes"))
      author_quote_page.css("#quotesList .grid-item").collect do |i|
        {:body => i.css("a.b-qt").text, :author => i.css("a.bq-aut").text}                                                          # The webpage for each author contains 60 quotes
      end.uniq.delete_if {|quote| quote[:body].blank? }
    end
  
    def self.category_quotes(category_link)
      category_quote_page = Nokogiri::HTML(open(category_link))                                        #category_quote_page = Nokogiri::HTML(open("https://www.brainyquote.com/topics/love-quotes"))
      category_quote_page.css("#quotesList .grid-item").collect do |i|
        {:body => i.css("a.b-qt").text, :author => i.css("a.bq-aut").text}                             # Each category webpage contains a total of 60 quotes
      end.uniq.delete_if {|quote| quote[:body].blank? }
    end
  
end
  
