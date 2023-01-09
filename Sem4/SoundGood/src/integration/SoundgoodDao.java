package integration;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.InstrumentItem;


public class SoundgoodDao {

    /*
     * 1. Write an SQL command that does the proper instructions, for example finds all of something or inserts data somewhere.
     * 2. Replace all mentions of columns and tables with static final strings, see below. Replace input with ? 
     * 3. Write a function that setstrings for inputs. Setstring(index, input) replaces index ? with an input
     * 4. Function executes query and saves it in a result. 
     */
    Connection connection;
    private PreparedStatement findInstrumentStmt;
    private PreparedStatement rentAnInstrumentStmt;
    private PreparedStatement howManyLeasesStmt;
    private PreparedStatement rentableInstrumentStmt;
    private PreparedStatement terminateLeaseStmt;
    private PreparedStatement getOneLeaseStmt;
    private static final String INS_PRICE_COLUMN = "price";
    private static final String INS_BRAND_COLUMN = "brand";
    private static final String INS_SRL_COLUMN = "serial_number";
    private static final String INS_LEASE_COLUMN = "lease_id";
    private static final String INSTRUMENT_TABLE = "intstrumentItem";

    private static final String LEASE_TABLE = "lease";
    private static final String LES_STUDENTID_COLUMN = "id";
    private static final String LES_LEASE_ID_COLUMN = "lease_id";





    /**
     * 
     */
    public SoundgoodDao() throws DatabaseException{
        try {
            connectToDB();
            prepStatements();
        } catch (ClassNotFoundException | SQLException exception) {
            throw new DatabaseException("Database connection failed. ", exception);
        }
        
    }
    //ADDED FOR SEM 5, A LOT OTHER WAS CHANGED LOOK 
    public boolean doesLeaseExist(int lease_id) throws DatabaseException{
        ResultSet r = null;
        try{
            getOneLeaseStmt.setInt(1, lease_id);
            r = getOneLeaseStmt.executeQuery();
            r.next();
            return(!r.getBoolean(5));
        }
        catch(SQLException e){
            handleException("Lease doesn't exist. Please double check the lease_ID.", e);
        }
        return false;
    }
    public void updateTerminateLease(int lease_id) throws DatabaseException{
        try{
            terminateLeaseStmt.setInt(1, lease_id);
            terminateLeaseStmt.setInt(2, lease_id);
            terminateLeaseStmt.execute();
            connection.commit();
        }
        catch(SQLException e){
            handleException("Failed to terminate lease.", e);
        }
    }
    private void connectToDB() throws ClassNotFoundException, SQLException {
        connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/soundgood",
                                                 "postgres", "Edde02qq");
        connection.setAutoCommit(false);

    }
    public int findHowManyLeases(int studentID) throws DatabaseException{
        ResultSet r = null;
        try{
            howManyLeasesStmt.setInt(1, studentID);
            r = howManyLeasesStmt.executeQuery();
            r.next();
            return (r.getInt(1));

        }
        catch(SQLException e){
            throw new DatabaseException("Database connection failed. " + e.getMessage(), e);
        }
    }
    public boolean findIfAnInstrumentLeasable(String serial) throws DatabaseException{
        try{
        ResultSet r = null;
        rentableInstrumentStmt.setString(1, serial);
        r = rentableInstrumentStmt.executeQuery();
        if(r.next()) return true;
        return false;
        }
        catch(SQLException err){
            throw new DatabaseException("Database connection failed. " + err.getMessage(), err);
        }
    }
    void print( int s){
        System.out.println(s);
    }
    public void updateRentInstrument(int studentID, String serialNumber) throws DatabaseException{
        try{
                rentAnInstrumentStmt.setInt(1, studentID);
                rentAnInstrumentStmt.setInt(2, studentID);
                rentAnInstrumentStmt.setString(3, serialNumber);
                rentAnInstrumentStmt.execute();
                connection.commit();
            }
        catch(SQLException e){
            throw new DatabaseException("Database exception. " + e.getMessage());
        }
    }
    public List<InstrumentItem> findAllAvalInstruments(String instrumentType) throws DatabaseException{
        List<InstrumentItem> instrumentInfos = new ArrayList<>();
        ResultSet queryReturn = null;
        try{
            findInstrumentStmt.setString(1, instrumentType);
            queryReturn = findInstrumentStmt.executeQuery();
            while(queryReturn.next()){
                instrumentInfos.add(new InstrumentItem(queryReturn.getString(1), Integer.parseInt(queryReturn.getString(3)), queryReturn.getString(2)));
            }
            connection.commit();
        }
        catch(SQLException e){
            handleException("Couldn't list all avaliable instruments. ", e);
        }
        return instrumentInfos;
    }

    private void prepStatements() throws SQLException{
        findInstrumentStmt = connection.prepareStatement("SELECT " +
        "item."+ INS_SRL_COLUMN+ " as \"SERIAL\", " + 
        "item."+ INS_BRAND_COLUMN+ " as \"BRAND\", " + 
        "item."+ INS_PRICE_COLUMN +" as \"FEE\" " + 
    "FROM " +
        INSTRUMENT_TABLE + " item " + 
    "WHERE "  + "item." + INS_LEASE_COLUMN+" is null AND item.instrumentType = ?");
    
    ///////////////////////
    rentAnInstrumentStmt = connection.prepareStatement(
    "SELECT * FROM lease FOR UPDATE;" + 
    "INSERT INTO lease (startTime,endTime,id)" +
    " VALUES(CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL'1 year', ?);" +
    "SELECT * FROM " + INSTRUMENT_TABLE + " FOR UPDATE; " +
    " UPDATE " + INSTRUMENT_TABLE +
    " SET " + INS_LEASE_COLUMN+ " = " + LEASE_TABLE + "." + LES_LEASE_ID_COLUMN + 
    " FROM " + LEASE_TABLE +
    " WHERE " + LEASE_TABLE + "." + LES_STUDENTID_COLUMN + "= ? AND " +  INS_SRL_COLUMN + "= ? AND " + INSTRUMENT_TABLE+"." +INS_LEASE_COLUMN + " is null;");

    howManyLeasesStmt = connection.prepareStatement("SELECT * FROM lease FOR UPDATE; select count(CASE WHEN ? = " + LEASE_TABLE + "." + LES_STUDENTID_COLUMN + " THEN 1 END) from " + LEASE_TABLE + ";");

    rentableInstrumentStmt = connection.prepareStatement("SELECT * FROM intstrumentItem WHERE serial_number = ? AND lease_id is null;");
    

    ///////////////////
    // sem 4.3 script goes here
    
    terminateLeaseStmt = connection.prepareStatement(
        "SELECT * FROM " + INSTRUMENT_TABLE + " FOR UPDATE;" + 
        "SELECT * FROM "+ LEASE_TABLE+ " FOR UPDATE;" + 
        "UPDATE " + INSTRUMENT_TABLE + " SET " + INS_LEASE_COLUMN + " = null WHERE " + INS_LEASE_COLUMN+" = ?;" +
        "UPDATE " + LEASE_TABLE + " SET " + LES_STUDENTID_COLUMN + " = null, terminated = true, endTime = CURRENT_TIMESTAMP WHERE " + LEASE_TABLE + ".lease_id = ?;");

    getOneLeaseStmt = connection.prepareStatement("SELECT * FROM " + LEASE_TABLE + " WHERE " + LES_LEASE_ID_COLUMN + "= ?;");
}

/**Taken with minor edits from github leifll
 * 
 * @param failureMsg
 * @param cause
 * @throws DatabaseException
 * 
 */
private void handleException(String failureMsg, Exception cause) throws DatabaseException {
    String completeFailureMsg = failureMsg;
    try {
        connection.rollback();
    } catch (SQLException rollbackExc) {
        completeFailureMsg = completeFailureMsg + 
        ". Also failed to rollback transaction because of: " + rollbackExc.getMessage();
    }
    if (cause != null) {
        throw new DatabaseException(failureMsg, cause);
    } else {
        throw new DatabaseException(failureMsg);
    }
    }
}
