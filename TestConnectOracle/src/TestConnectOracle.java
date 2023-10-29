
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class TestConnectOracle {

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            String url = "jdbc:oracle:thin:@localhost:1521:orcl"; 
            String uname = "system"; 
            String upass = "oracle";
            connection  = DriverManager.getConnection(url, uname, upass);
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return connection ;
    }
    public static void closeConnection(Connection con){
        if(con != null){
            try {
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
    }

