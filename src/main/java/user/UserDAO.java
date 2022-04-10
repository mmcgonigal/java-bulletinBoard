package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    //  DAO  -->  회원 데이타 베이스에 접급할 수 있도록 만드는 데이터베이스 엑세스 오프젝트 , 실질적으로 데이터베이스에서 회원 정보를 불러오거나, 데이터베이스에 회원 정보를 넣고자 할 때 사용
    private Connection connection; // 데이터베이스에 접근하게 해주는 하나의 객체
    private PreparedStatement preparedStatement;
    private ResultSet rs; // 정보를 담을 수 있는 하나의 객체

    //자동으로 데이터베이스 커넧션이 이루어 지도록 생성자를 만들어 줌

   public UserDAO(){
          try{
              String url = "jdbc:mysql://localhost:3306/bulletinboard_db";
              String id = "root";
              String password = "codeup";


          }catch(Exception e){
              e.printStackTrace();
        }
    }



}
