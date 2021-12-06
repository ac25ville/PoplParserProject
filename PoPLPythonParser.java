import java.util.*;
import java.io.*;

public class PoPLPythonParser {
/*

    Python Parser for Principles of Programming Languages.
    Tokenizes the whole file into a collection
    Then pops individual words comparing it to keywords
    Based on a case of each keyword in a switch statement
    Preform a certian action or move to another statement

    So that there may be uniformity among the file
    Function descriptions go above the function
    Use this format:
    // open block comment
    Desc:
        Decent Function Description

    Return:
        Discuss what return values there will be, "void" if no return values

    // close block comment
    Look to tokenizeFile for reference
*/

    //functions start
    public static void main (String[] args){
        ArrayList<ArrayList <String>> tokens = tokenizeFile();
        tokens.forEach((line) -> {
            line.forEach((token) -> System.out.println(token));
        });
    }

    /*
    Desc:
        Function for tokenizing the python file
        2D ArrayList of tokens
        Each index is a new line, which contains all the tokens in an array

        Specfically:
                    Index     Token ArrayList
                      1       [#, Hello, World]
                      2       [#, My, name, is, Austin]
                     ...      [...]
    Return:
        NULL on error
        ArrayList<ArrayList <String>> on success
    */
    private static ArrayList<ArrayList <String>> tokenizeFile(){
        File file = new File("python_test_code.py");
        if(!file.equals(null)){ //check file object
            ArrayList<ArrayList<String>> tokens = new ArrayList<ArrayList<String>>();
            Scanner reader;
            try{
                reader = new Scanner(file);
            }catch(Exception e){
                System.out.println("Exception");
                return null;
            }
            while(reader.hasNextLine()){
                String nextLine = reader.nextLine();
                StringTokenizer tokenizer = new StringTokenizer(nextLine, " ");
                ArrayList<String> temp = new ArrayList<String>();
                while(tokenizer.hasMoreTokens()){
                    temp.add(tokenizer.nextToken());
                }
                tokens.add(temp);
            }
            reader.close();
            return tokens;
        }
        return null;
    }
}