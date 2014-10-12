package jp.tomorrowkey.appengine.regularexpression.controller;

import jp.tomorrowkey.appengine.regularexpression.controller.meta.RegexTestMeta;
import jp.tomorrowkey.appengine.regularexpression.controller.model.RegexTest;
import jp.tomorrowkey.appengine.regularexpression.entity.Share;
import jp.tomorrowkey.appengine.regularexpression.entity.ShareGen;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.datastore.Datastore;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

public class ShareController extends Controller {

    @Override
    protected Navigation run() throws Exception {
        if (!isPost()) {
            throw new UnsupportedOperationException();
        }

        String targetText = param("target_text");
        String matchPattern = param("match_pattern");
        boolean multiLine = asBoolean("multiline");
        String replacePattern = param("replace_pattern");

        RegexTest regexTest =
            findRegexTest(targetText, matchPattern, multiLine, replacePattern);

        if (regexTest != null) {
            String id = regexTest.getId();
            respond(id);
            return null;
        }

        regexTest =
            saveNewRegexTest(
                newUniqueId(),
                targetText,
                matchPattern,
                multiLine,
                replacePattern);
        respond(regexTest.getId());

        return null;
    }

    private RegexTest saveNewRegexTest(String id, String targetText,
            String matchPattern, boolean multiLine, String replacePattern) {
        RegexTest regexTest =
            new RegexTest(targetText, matchPattern, multiLine, replacePattern);
        regexTest.setId(id);
        Datastore.put(regexTest);

        return regexTest;
    }

    private RegexTest findRegexTest(String targetText, String matchPattern,
            boolean multiLine, String replacePattern) {
        RegexTestMeta meta = RegexTestMeta.get();
        List<RegexTest> list =
            Datastore
                .query(meta)
                .filter(
                    meta.targetText.equal(targetText),
                    meta.matchPattern.equal(matchPattern),
                    meta.multiLine.equal(multiLine),
                    meta.replacePattern.equal(replacePattern))
                .asList();
        if (list.isEmpty()) {
            return null;
        } else {
            return list.get(0);
        }
    }

    private void respond(String id) throws IOException {
        Share share = new Share(id);
        response.setStatus(200);
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");

        PrintWriter writer = response.getWriter();
        ShareGen.encode(writer, share);
    }

    private String newUniqueId() {
        String id = UUID.randomUUID().toString();
        RegexTestMeta meta = RegexTestMeta.get();
        if (Datastore.query(meta).filter(meta.id.equal(id)).asList().isEmpty()) {
            return id;
        } else {
            return newUniqueId();
        }
    }
}
