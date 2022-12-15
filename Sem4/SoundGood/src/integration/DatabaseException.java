package integration;

public class DatabaseException extends Exception {
    String msg;
    public DatabaseException(String reason) {
        super(reason);
        msg = reason;

    }
    public DatabaseException(String reason, Throwable rootCause) {
        super(reason, rootCause);
        msg = reason;
    }
    @Override public String getMessage(){
        return this.msg;
    }
}
