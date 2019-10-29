require 'webrick'

module WEBrick
  module HTTPServlet
    FileHandler.add_handler('rb', CGIHandler)
  end
end

server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})

['INT','TERM'].each{|signal|
 Signal.trap(signal){server.shutdown}
}

server.mount('/test2', WEBrick::HTTPServlet::ERBHandler,'test2.html.erb')
server.mount('/goya2.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya2.rb')
server.mount('/goya3.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya3.rb')
server.start
