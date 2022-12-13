import java.sql.*;

public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("Hello, World!");
    }
    private void connectToBankDB() throws ClassNotFoundException, SQLException {
        connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/bankdb",
                                                 "postgres", "postgres");
        // connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankdb",
        //                                          "mysql", "mysql");
        connection.setAutoCommit(false);
    }
}
