
import views.BlockingInterpreter;
import controller.*;
import integration.DatabaseException;

public class App {
    public static void main(String[] args) throws Exception {
        try {
            new BlockingInterpreter(new Controller()).handleCmds();
            } catch(DatabaseException bdbe) {
                System.out.println("Could not connect to Soundgood DB. Please make sure you have drivers correctly referenced.");
                bdbe.printStackTrace();
            }


    }

}
