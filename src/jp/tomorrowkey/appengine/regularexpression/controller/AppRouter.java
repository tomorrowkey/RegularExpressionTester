package jp.tomorrowkey.appengine.regularexpression.controller;

import org.slim3.controller.router.RouterImpl;

public class AppRouter extends RouterImpl {
    public AppRouter() {
        addRouting("/regex/{id}", "/regex?id={id}");
    }
}
