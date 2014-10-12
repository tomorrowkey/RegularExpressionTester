package jp.tomorrowkey.appengine.regularexpression.controller.model;

import com.google.appengine.api.datastore.Key;

import org.slim3.datastore.Attribute;
import org.slim3.datastore.Model;

@Model
public class RegexTest {

    @Attribute(primaryKey = true)
    private Key key;

    private String id;

    private String targetText;

    private String matchPattern;

    private boolean multiLine;

    private String replacePattern;

    public RegexTest() {
    }

    public RegexTest(String targetText, String matchPattern, boolean multiLine,
            String replacePattern) {
        this.targetText = targetText;
        this.matchPattern = matchPattern;
        this.multiLine = multiLine;
        this.replacePattern = replacePattern;
    }

    public Key getKey() {
        return key;
    }

    public void setKey(Key key) {
        this.key = key;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTargetText() {
        return targetText;
    }

    public void setTargetText(String targetText) {
        this.targetText = targetText;
    }

    public String getMatchPattern() {
        return matchPattern;
    }

    public void setMatchPattern(String matchPattern) {
        this.matchPattern = matchPattern;
    }

    public boolean isMultiLine() {
        return multiLine;
    }

    public void setMultiLine(boolean multiLine) {
        this.multiLine = multiLine;
    }

    public String getReplacePattern() {
        return replacePattern;
    }

    public void setReplacePattern(String replacePattern) {
        this.replacePattern = replacePattern;
    }

}
