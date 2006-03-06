class BackendController < ApplicationController
  cache_sweeper :blog_sweeper
  session :off

  web_service_dispatching_mode :layered
  web_service(:metaWeblog)  { MetaWeblogService.new(self) }
  web_service(:mt)          { MovableTypeService.new(self) }
  web_service(:blogger)     { BloggerService.new(self) }

  alias xmlrpc api
end
