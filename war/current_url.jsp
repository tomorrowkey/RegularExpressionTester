<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %><% 
{
    String scheme = request.getScheme().toString();
    String host = request.getServerName().toString();
    int port = request.getLocalPort();
    String url;
    if(port == 80 || port == 0) {
        url = scheme + "://" + host;
    } else {
        url = scheme + "://" + host + ":" + port;
    }
    out.print(url);
}
%>