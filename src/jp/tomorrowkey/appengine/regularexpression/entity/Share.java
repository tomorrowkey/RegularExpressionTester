package jp.tomorrowkey.appengine.regularexpression.entity;

import net.vvakame.util.jsonpullparser.annotation.JsonKey;
import net.vvakame.util.jsonpullparser.annotation.JsonModel;

@JsonModel
public class Share {

    @JsonKey(value = "id")
    private String id;

    public Share() {
    }

    public Share(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

}
