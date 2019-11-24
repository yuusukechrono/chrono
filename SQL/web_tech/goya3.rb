require 'cgi'
cgi = CGI.new

cgi.out("type" => "text/html", "charset" => "UTF-8"){

  get = cgi['goya3']

  "<html>
    <body>
      <p>品質が悪いものの情報は下記になります</p>
      #{get}
    </body>
   </html>"
}
