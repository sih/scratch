import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author sih
 */
public class MyService {


    private static final Logger LOGGER = LoggerFactory.getLogger(MyService.class);

    public String execute(String name) {

        for (int i = 2; i > 0; i--) {
            if (i%2 == 0) {
                logger().error("Even number");
            }
            else {
                logger().info("Odd number");
            }
        }

        return "Hello, "+name+"!";

    }


    Logger logger() {
        return LOGGER;
    }
}
