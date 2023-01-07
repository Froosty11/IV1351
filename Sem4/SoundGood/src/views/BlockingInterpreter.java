

package views;

import java.util.List;
import java.util.Scanner;
import controller.Controller;
import model.InstrumentItem;

/**
 * Reads and interprets user commands. This command interpreter is blocking, the user
 * interface does not react to user input while a command is being executed.
 */
public class BlockingInterpreter {
    private static final String PROMPT = "> ";
    private final Scanner console = new Scanner(System.in);
    private Controller ctrl;
    private boolean keepReceivingCmds = false;

    /**
     * Creates a new instance that will use the specified controller for all operations.
     * 
     * @param ctrl The controller used by this instance.
     */
    public BlockingInterpreter(Controller ctrl) {
        this.ctrl = ctrl;
    }

    /**
     * Stops the commend interpreter.
     */
    public void stop() {
        keepReceivingCmds = false;
    }

    /**
     * Interprets and performs user commands. This method will not return until the
     * UI has been stopped. The UI is stopped either when the user gives the
     * "quit" command, or when the method <code>stop()</code> is called.
     */
    public void handleCmds() {
        keepReceivingCmds = true;
        while (keepReceivingCmds) {
            try {
                CmdLine cmdLine = new CmdLine(readNextLine());
                switch (cmdLine.getCmd()) {
                    case INSTRUMENTLIST:
                    //list all instruments
                    List<InstrumentItem> s = ctrl.ListAllInstruments(cmdLine.getParameter(0));
                    for (InstrumentItem string : s) {
                        System.out.println(string);
                    }
                    break;
                    case TERMINATE:
                    try{
                    ctrl.terminateLease(Integer.valueOf(cmdLine.getParameter(0)));
                    }
                    catch(NumberFormatException er){
                        System.out.println("Number format is wrong, make sure to write an integer. ");
                    }
                    //terminate
                    break;
                    case RENT: 
                    ctrl.startNewLease(Integer.valueOf(cmdLine.getParameter(1)), cmdLine.getParameter(0));
                    //RENT
                    break;
                    case HELP:
                        for (Command command : Command.values()) {
                            if (command == Command.ILLEGAL_COMMAND) {
                                continue;
                            }
                            System.out.println(command.toString().toLowerCase());
                        }
                        break;
                    
                    default:
                        System.out.println("Illegal command. \"help\" to see avaliable commands.");
                }
            } catch (Exception e) {
                System.out.println("Operation failed");
                System.out.println(e.getMessage());
                e.printStackTrace();
            }
        }
    }

    private String readNextLine() {
        System.out.print(PROMPT);
        return console.nextLine();
    }
}
