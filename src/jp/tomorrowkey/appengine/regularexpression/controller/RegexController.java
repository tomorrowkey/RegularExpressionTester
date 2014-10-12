package jp.tomorrowkey.appengine.regularexpression.controller;

import jp.tomorrowkey.appengine.regularexpression.controller.meta.RegexTestMeta;
import jp.tomorrowkey.appengine.regularexpression.controller.model.RegexTest;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.datastore.Datastore;
import org.slim3.util.StringUtil;

public class RegexController extends Controller {

    @Override
    protected Navigation run() throws Exception {
        String id = param("id");

        requestScope("multiline", true);

        if (StringUtil.isEmpty(id)) {
            return forward("index.jsp");
        }

        RegexTestMeta meta = RegexTestMeta.get();
        RegexTest regexTest =
            Datastore.query(meta).filter(meta.id.equal(id)).asSingle();
        if (regexTest == null) {
            return forward("index.jsp");
        }

        requestScope("target_text", regexTest.getTargetText());
        requestScope("match_pattern", regexTest.getMatchPattern());
        requestScope("multiline", regexTest.isMultiLine());
        requestScope("replace_pattern", regexTest.getReplacePattern());

        return forward("index.jsp");
    }

}
