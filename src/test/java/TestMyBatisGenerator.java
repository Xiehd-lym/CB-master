import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.api.ShellCallback;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class TestMyBatisGenerator {
    public static void main(String[] args) throws Exception{
        List<String> warnings = new ArrayList<String>();
        boolean overwrite = true;
        File configFile = new File(MyBatisGenerator.class.getClassLoader().getResource("generatorConfig.xml").toURI());
        ConfigurationParser cp = new ConfigurationParser(warnings);
        Configuration config = cp.parseConfiguration(configFile);
        ShellCallback callback = new DefaultShellCallback(overwrite);
        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config,callback,warnings);
        myBatisGenerator.generate(null);
    }
}
