package MapperMethodTest;

import com.seguoer.config.AppConfig;
import com.seguoer.mapper.UserMapper;
import org.commonmark.parser.Parser;
import org.commonmark.renderer.html.HtmlRenderer;
import org.commonmark.node.Node;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

@SpringJUnitConfig(AppConfig.class)
public class mdToHtmlTest {
    @Autowired
    UserMapper userMapper;
    @Test
    @DisplayName("拿到数据库博客的内容")
    void GetMySQLContent(){
        String mySQL = userMapper.selectBlogContent("MySQL");
        System.out.println(mySQL);
    }
}
