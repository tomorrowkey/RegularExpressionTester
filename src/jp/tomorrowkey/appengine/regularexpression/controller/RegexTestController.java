package jp.tomorrowkey.appengine.regularexpression.controller;

import jp.tomorrowkey.appengine.regularexpression.controller.model.Group;
import jp.tomorrowkey.appengine.regularexpression.controller.model.RegexTestResult;
import jp.tomorrowkey.appengine.regularexpression.controller.model.RegexTestResultGen;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.util.StringUtil;

import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

public class RegexTestController extends Controller {

    @Override
    protected Navigation run() throws Exception {
        String targetText = param("target_text");
        String matchPattern = param("match_pattern");
        String replacePattern = param("replace_pattern");

        if (StringUtil.isEmpty(targetText))
            throw new BadParameterException("Target text must not be empty");

        if (StringUtil.isEmpty(matchPattern))
            throw new BadParameterException("Regex pattern must not be empty");

        Pattern pattern = Pattern.compile(matchPattern);
        Matcher matcher = pattern.matcher(targetText);

        RegexTestResult result = new RegexTestResult();

        result.setText(targetText);
        result.setMatches(matcher.matches());
        matcher.reset();
        result.setReplacedText(matcher.replaceAll(replacePattern));

        matcher.reset();
        while (matcher.find()) {
            String matchText = matcher.group();
            int start = matcher.start();
            int end = matcher.end();
            result.addGroup(new Group(matchText, start, end));
        }

        response.setStatus(200);
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");

        PrintWriter writer = response.getWriter();
        RegexTestResultGen.encode(writer, result);

        return null;
    }

    @Override
    protected Navigation handleError(Throwable error) throws Throwable {
        if (error instanceof PatternSyntaxException
            || error instanceof BadParameterException) {
            response.setStatus(400);
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            PrintWriter writer = response.getWriter();
            writer.write(error.getMessage());
            return null;
        }

        throw error;
    }

    private static class BadParameterException extends RuntimeException {

        private static final long serialVersionUID = 1L;

        public BadParameterException(String message) {
            super(message);
        }
    }

}
