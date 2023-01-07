package controller;
import java.util.ArrayList;
import java.util.List;


import integration.DatabaseException;
import model.InstrumentItem;
import integration.SoundgoodDao;

public class Controller {
    private final SoundgoodDao sgDB;
    /** Controller is responsible for calling to the DAO. This constructor just constructs the controller that is later called by the 
     * command prompt interface. 
     */
    public Controller() throws DatabaseException{
        sgDB = new SoundgoodDao();
        }
    
    public List<InstrumentItem> ListAllInstruments(String instrumentType){
        if(instrumentType == null){
            return new ArrayList<InstrumentItem>();
        }
        try{
            List<InstrumentItem> returnList = sgDB.findAllAvalInstruments(instrumentType);
            return returnList;
        }
        catch(DatabaseException er){
            er.printStackTrace();
            return null;
        }
    }

    public void terminateLease(int leaseID){
        try{
            sgDB.updateTerminateLease(leaseID);
        }
        catch(DatabaseException er){
            System.out.println(er.getMessage());
        }    }

    
    public void startNewLease(int studentID, String serial){
        String errMsg = "Generic database exception!";

        try{
            errMsg = "Instrument doesn't exist or is already leased.";

            if(sgDB.findIfAnInstrumentLeasable(serial)){
                errMsg = "Student doesn't exist or has already leased two instruments!";
                int i = sgDB.findHowManyLeases(studentID);
                //System.out.println(i);
                if(i < 2 && i >= 0 ){
                    sgDB.updateRentInstrument(studentID, serial);
                }
                else{
                    throw new DatabaseException(errMsg);
                }
            }
            
        }
        catch(DatabaseException er){
            System.out.println(errMsg);
        }
    }

    
}
