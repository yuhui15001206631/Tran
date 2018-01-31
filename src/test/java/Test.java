import com.yyw.service.GradeService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by Administrator on 2018/1/12.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class Test {
    @Autowired
    private GradeService gradeService;
    @org.junit.Test
    public void deletegrade(){
        Integer res=gradeService.deleteGradeById(96);
        System.out.println(res);
    }
}
