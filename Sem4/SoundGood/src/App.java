
import integration.SoundgoodDao;
import java.util.List;

public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("Hello, World!");
        SoundgoodDao sDB = new SoundgoodDao();
        List<String> s = sDB.findAllAvalInstruments("Guitar");
        for (String string : s) {
            System.out.println(string);
        }

    }

}
