

package views;

/**
 * Defines all commands that can be performed by a user of the chat application.
 */
public enum Command {
    /* Lists all unrented instruments INSTRUMENTLIST*/ 
    INSTRUMENTLIST, 
    /*Terminate renting an instrument Syntax TERMINATE instrument */
    TERMINATE,
    /*Rent an instrument RENT instrument */
    RENT,
    /*HELP shows all avaliable commands. We can also call this with "?" */
    HELP,
    /*Illegal command.*/
    ILLEGAL_COMMAND
}
