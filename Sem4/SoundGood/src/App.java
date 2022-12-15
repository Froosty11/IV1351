
import integration.SoundgoodDao;
import java.util.List;
import views.BlockingInterpreter;
import controller.*;
import integration.DatabaseException;

public class App {
    public static void main(String[] args) throws Exception {
        try {
            new BlockingInterpreter(new Controller()).handleCmds();
            } catch(DatabaseException bdbe) {
                System.out.println("Could not connect to Bank db.");
                bdbe.printStackTrace();
            }


    }

}
