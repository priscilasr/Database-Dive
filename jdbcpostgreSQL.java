import java.sql.*;
import java.io.File;
import java.util.Scanner;


public class jdbcpostgreSQL {

  //Commands to run this script
  //This will compile all java files in this directory
  //javac *.java
  //This command tells the file where to find the postgres jar which it needs to execute postgres commands, then executes the code
  //Windows: java -cp ".;postgresql-42.2.8.jar" jdbcpostgreSQL
  //Mac/Linux: java -cp ".:postgresql-42.2.8.jar" jdbcpostgreSQL

  //MAKE SURE YOU ARE ON VPN or TAMU WIFI TO ACCESS DATABASE
    public static void main(String args[]) {

        //Building the connection with your credentials
        //TODO: update dbName, userName, and userPassword here
        Connection conn = null;
        String teamNumber = "1";
        String sectionNumber = "914";
        String dbName = "csce315" + "_" + sectionNumber + "_" + teamNumber + "_" + "db";
        String dbConnectionString = "jdbc:postgresql://csce-315-db.engr.tamu.edu/" + dbName;
        String userName = "csce315" + "_" + sectionNumber + "_" + teamNumber + "_" + "user";
        String userPassword = "PZKNJ123";

        //Connecting to the database
        try {
            conn = DriverManager.getConnection(dbConnectionString,userName, userPassword);
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getClass().getName()+": "+e.getMessage());
            System.exit(0);
        }

        int result;
        String sqlStatement;

        System.out.println("Opened database successfully");
        try{

            Statement stmt = conn.createStatement();
            sqlStatement = "\\i script.sql\n\\i actpairs.sql\n\\i customermovie.sql\n\\i recomended.sql\n\\i notrecomended.sql;";
            System.out.println(sqlStatement);
            result = stmt.executeUpdate(sqlStatement);
            System.out.println(result);
            




        }
        catch(Exception e){
            e.printStackTrace();
            System.err.println(e.getClass().getName()+": "+e.getMessage());
            System.exit(0);
        }

        

        //closing the connection
        try {
        conn.close();
        System.out.println("Connection Closed.");
        } catch(Exception e) {
        System.out.println("Connection NOT Closed.");
        }//end try catch
    }//end main
}//end Class
