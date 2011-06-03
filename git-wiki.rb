module GitWiki
  class << self
    attr_accessor :extension, :repository, :git_instance, :default_branch
  end

  def self.new(repository, extension, default_branch)
    self.extension  = extension
    self.repository = Grit::Repo.new(repository)
    self.git_instance = Git.open(working_dir = repository)
    self.default_branch = default_branch
    
    App
  end

  class PageNotFound < Sinatra::NotFound
    attr_reader :name

    def initialize(name)
      @name = name
    end
  end

  class Page
    def self.find_all(branch = default_branch)
      return [] if repository.tree(branch).contents.empty?
      repository.tree(branch).contents.collect { |blob| new(blob) }
    end

    def self.find(name, branch = default_branch)
      page_blob = find_blob(name, branch)
      raise PageNotFound.new(name) unless page_blob
      new(page_blob)
    end

    def self.repository
      GitWiki.repository || raise
    end

    def self.extension
      GitWiki.extension || raise
    end

    def self.find_blob(page_name, branch = default_branch)
      repository.tree(branch)/(page_name + extension)
    end
    private_class_method :find_blob
    
    def initialize(blob)
      @blob = blob
    end

    def to_html
      RDiscount.new(content).to_html
    end

    def to_s
      name
    end

    def name
      @blob.name.gsub(/#{File.extname(@blob.name)}$/, '')
    end

    def content
      @blob.data
    end
  end

  class App < Sinatra::Base
    set :app_file, __FILE__
    set :haml, { :format => :html5, :attr_wrapper  => '"' }
    use_in_file_templates!

    error PageNotFound do
     "404 #{request.env["sinatra.error"].message}"
    end

    before do
      content_type "text/html", :charset => "utf-8"
      @branches = GitWiki.git_instance.branches.collect{|br| br.name}
    end

    get "/" do
      @branch = params[:branch] || GitWiki.default_branch
      redirect "/pages/#{@branch}"
    end

    get "/pages/:branch" do
      @branch = params[:branch] || GitWiki.default_branch
      @pages = Page.find_all(@branch)
      haml :list
    end

    get "/:branch/:page" do
      @branch = params[:branch] || GitWiki.default_branch
      @page = Page.find(params[:page], @branch)
      haml :show
    end

    private
      def title(title=nil)
        @title = title.to_s unless title.nil?
        @title
      end

      def list_item(page, branch)
        %Q{<a class="page_name" href="/#{branch}/#{page}">#{page.name}</a>}
      end
  end
end

__END__
@@ layout
!!!
%html
  %head
    %title= title
    %link(rel='stylesheet' href="/css/application.css" type='text/css')
    %link(rel='stylesheet' href="/css/css3-github-buttons.css" type ='text/css')
    %script(src="/javascripts/jquery.js")
    %script(src="/javascripts/application.js")
  %body
    %div{ :id => "container" }
      %select{:name => "branch[name]", :id => "branchName"}
        - for br in @branches
          %option{:value => "/pages/#{br}", :selected => (br==@branch)? true : false} #{br} 
      %a.button.icon.home{:href => "/pages/#{@branch}"} Homepage
      #content= yield

@@ show
- title @page.name
%h1= title
#content
  ~"#{@page.to_html}"

@@ list
- title "Listing pages"
%h1 All pages
- if @pages.empty?
  %p No pages found.
- else
  %ul#list
    - @pages.each do |page|
      %li= list_item(page, @branch)
