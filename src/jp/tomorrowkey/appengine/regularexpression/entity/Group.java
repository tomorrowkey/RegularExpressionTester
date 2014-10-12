package jp.tomorrowkey.appengine.regularexpression.entity;

import net.vvakame.util.jsonpullparser.annotation.JsonKey;
import net.vvakame.util.jsonpullparser.annotation.JsonModel;

@JsonModel(decamelize = true)
public class Group {

    @JsonKey
    private int start;

    @JsonKey
    private int end;

    @JsonKey
    private String text;

    public Group() {
    }

    public Group(String text, int start, int end) {
        this.text = text;
        this.start = start;
        this.end = end;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getStart() {
        return start;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public int getEnd() {
        return end;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getText() {
        return text;
    }
}
