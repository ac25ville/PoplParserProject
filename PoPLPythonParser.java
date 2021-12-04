import java.util.*;

public class PoPLPythonParser {
/*

    Python Parser for Principles of Programming Languages.
    Tokenizes the whole file into a collection
    Then pops individual words comparing it to keywords
    Based on a case of each keyword in a switch statement
    Preform a certian action or move to another statement

*/




    //functions start
    public static void main (String[] args){
        ArrayList tokens = new ArrayList<String>();
        tokenizeFile(tokens);
    }

    /*
    Desc:
        Function for tokenizing the python file
        Pass tokens ArrayList
    Return:
        < (0) on error
        number of tokens parsed on success
    */
    private int tokenizeFile(ArrayList<String> tokens){
        if(!tokens.equals(null) || tokens.size()>=0){ //check tokens object
            System.out.println(tokens.size());
        }

        return -1;
    }
}