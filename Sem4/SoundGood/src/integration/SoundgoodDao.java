package integration;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SoundgoodDao {

    /*
     * 1. Write an SQL command that does the proper instructions, for example finds all of something or inserts data somewhere.
     * 2. Replace all mentions of columns and tables with static final strings, see below. Replace input with ? 
     * 3. Write a function that setstrings for inputs. Setstring(index, input) replaces index ? with an input
     * 4. Function executes query and saves it in a result. 
     */
    Connection connection;
    private PreparedStatement findInstrumentStmt;
    private static final String INS_PRICE_COLUMN = "price";
    private static final String INS_BRAND_COLUMN = "brand";
    private static final String INS_LEASE_COLUMN = "lease_id";
    private static final String INSTRUMENT_TABLE = "intstrumentItem";




    /**
     * 
     */
    public SoundgoodDao() throws ClassNotFoundException, SQLException{
        connectToDB();
        prepStatements();
        
    }
    private void connectToDB() throws ClassNotFoundException, SQLException {
        connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/soundgood",
                                                 "postgres", "Edde02qq");
        connection.setAutoCommit(false);
        System.out.println("Connection established");

    }
    public List<String> findAllAvalInstruments(String instrumentType){
        List<String> instrumentInfos = new ArrayList<>();
        ResultSet queryReturn = null;
        try{
            findInstrumentStmt.setString(1, instrumentType);
            queryReturn = findInstrumentStmt.executeQuery();
            while(queryReturn.next()){
                StringBuilder str = new StringBuilder();
                str.append(queryReturn.getString(1));
                str.append(" - ");
                str.append(queryReturn.getString(2));
                str.append("kr");
                instrumentInfos.add(new String(str));
            }
            connection.commit();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return instrumentInfos;
    }
    private void prepStatements() throws SQLException{
        findInstrumentStmt = connection.prepareStatement("SELECT " +
        "item."+ INS_BRAND_COLUMN+ " as \"BRAND\", " + 
        "item."+ INS_PRICE_COLUMN +" as \"FEE\" " + 
    "FROM " +
        INSTRUMENT_TABLE + " item " + 
    "WHERE "  + "item." + INS_LEASE_COLUMN+" is null AND item.instrumentType = ?");



    }
    
    /* 

    ("SELECT h." + HOLDER_COLUMN_NAME
            + ", a." + ACCT_NO_COLUMN_NAME + ", a." + BALANCE_COLUMN_NAME + " FROM "
            + HOLDER_TABLE_NAME + " h INNER JOIN " + ACCT_TABLE_NAME + " a ON a."
            + HOLDER_FK_COLUMN_NAME + " = h." + HOLDER_PK_COLUMN_NAME);


    public List<Instrument> findRentableInstrumentsOfType(String type) throws SQLException {
        String failMsg = "Could not fetch instruments";
        List<Instrument> instruments = new ArrayList<>();
        ResultSet result = null;
        try {

            listAvailableStmt.setString(1, type);
            result = listAvailableStmt.executeQuery();
            while (result.next()) {
                instruments.add(new Instrument(result.getString(1), result.getString(2), result.getFloat(3)));
            }
            connection.commit();
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(failMsg);
        }
        return instruments;
    }*/
}
