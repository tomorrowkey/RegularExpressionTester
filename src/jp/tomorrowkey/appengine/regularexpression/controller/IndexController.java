package jp.tomorrowkey.appengine.regularexpression.controller;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

public class IndexController extends Controller {

    @Override
    protected Navigation run() throws Exception {
        requestScope("multiline", true);
        return forward("index.jsp");
    }

}
