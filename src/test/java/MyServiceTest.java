import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.verify;
import static org.powermock.api.mockito.PowerMockito.*;

/**
 * @author sih
 */
@RunWith(PowerMockRunner.class)
@PrepareForTest({MyService.class, LoggerFactory.class})
public class MyServiceTest {

    MyService service;

    private Logger logger;

    @Before
    public void setUp() {

        mockStatic(LoggerFactory.class);
        logger = mock(Logger.class);
        when(LoggerFactory.getLogger(MyService.class)).thenReturn(logger);

        service = new MyService();

    }


    @Test
    public void executeShouldLogMessages() {

        // when
        String result = service.execute("London");

        // then
        assertEquals("Hello, London!", result);

        String[] messages = {"Even number", "Odd number"};

        verify(logger).error("Even number");
        verify(logger).info("Odd number");

    }

}