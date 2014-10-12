package jp.tomorrowkey.appengine.regularexpression.entity;

import java.util.ArrayList;
import java.util.List;

import net.vvakame.util.jsonpullparser.annotation.JsonKey;
import net.vvakame.util.jsonpullparser.annotation.JsonModel;

@JsonModel(decamelize = true)
public class RegexTestResult {

    @JsonKey
    private String text;

    @JsonKey
    private List<Group> groups = new ArrayList<Group>();

    @JsonKey
    private String replacedText;

    @JsonKey
    private boolean matches;

    public void setGroups(List<Group> groups) {
        this.groups = groups;
    }

    public List<Group> getGroups() {
        return groups;
    }

    public void addGroup(Group group) {
        groups.add(group);
    }

    public void setReplacedText(String replacedText) {
        this.replacedText = replacedText;
    }

    public String getReplacedText() {
        return replacedText;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getText() {
        return text;
    }

    public boolean isMatches() {
        return matches;
    }

    public void setMatches(boolean matches) {
        this.matches = matches;
    }

}
