package controller;
import java.util.ArrayList;
import java.util.List;

import integration.DatabaseException;
import integration.SoundgoodDao;

public class Controller {
    private final SoundgoodDao sgDB;
    /** Controller is responsible for calling to the DAO. This constructor just constructs the controller that is later called by the 
     * command prompt interface. 
     */
    public Controller() throws DatabaseException{
        sgDB = new SoundgoodDao();
        }
    
    public List<String> ListAllInstruments(String instrumentType){
        if(instrumentType == null){
            return new ArrayList<String>();
        }
        try{
            return sgDB.findAllAvalInstruments(instrumentType);
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
        try{
            sgDB.updateRentInstrument(studentID, serial);
        }
        catch(DatabaseException er){
            System.out.println(er.getMessage());
        }
    }

    
}
