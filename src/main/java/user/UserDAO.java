package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    //  DAO  -->  회원 데이타 베이스에 접급할 수 있도록 만드는 데이터베이스 엑세스 오프젝트 , 실질적으로 데이터베이스에서 회원 정보를 불러오거나, 데이터베이스에 회원 정보를 넣고자 할 때 사용
    private Connection connection; // 데이터베이스에 접근하게 해주는 하나의 객체
    private PreparedStatement statement;
    private ResultSet rs; // 정보를 담을 수 있는 하나의 객체

    //자동으로 데이터베이스 커넧션이 이루어 지도록 생성자를 만들어 줌

   public UserDAO(){
          try{
              String url = "jdbc:mysql://localhost:3306/bulletinboard_db";
              String id = "root";
              String password = "codeup";
              Class.forName("com.mysql.jdbc./driver"); //mysql 드라이버를 찾을 수 있도록 하는 매개체 라이브러리.
              connection = DriverManager.getConnection(url, id,password);//
          }catch(Exception e){
              e.printStackTrace();
        }
    }
    public int login (String user_id, String user_password){
       String SQL = "SELECT user_password FROM USERS WHERE user_id = ?";
       try{
           statement = connection.prepareStatement(SQL);//  프리페어드스테이트먼트에 어떠한 정해진 sql문장을 데이터베이스에 삽입하는 그러한 형식으로 인스턴스를 가져옴  .
           statement.setString(1,user_id); // sql 인젝션 같은 해킹 기법을 방어하기 위한 수단으로써 이렇게  preparedStatement 라는 걸 이용.
           //이렇게 하나의문장을 미리 준비해 놓았다가 (29번줄), 물음표를 미리 넣어놓고, 나중에 그 물음표에 해당하는  내용으로 32번 줄에 유저 아이디를 넣어놓은것임 . 즉 , 매개변수로 넘어온 유저아이디를 이렇게 물음표에 들어갈 수 있게 해줘서 실제로 데이터베이스에는 현재 접속을 시도하고자 하는 그 사용자의 id를 입력 받아서 그 아이디가 실제로 존재하는지, (라인 29) 그러고 실재로 존재 한다면, 그 비밀번호는 뭔지, 이렇게 데이터베이스에서 가져 오도록 (SELECT ) 하는것,
           rs =  statement.executeQuery(); // 그 다음, 이렇게, resultset 즉, 결과를 담을 수 있는 하나의 객체에다가, 이렇게 실행한 결과를 넣어줌,
           if(rs.next()){
               //결과가 존재 한다면,다시 그 결과로 패스워드 비교후, (라인37)  맞으면 로그인,
               if(rs.getString(1).equals(user_password)) {
                   return 1; //결과 존재, 그리고 아이디 존재하면서, 패스워드 동일,  로그인 성공
               }else return 0;  // 아이디 존재 하지만 , 패스워드 불일치,
           }
           return -1;// 결과값이 존재 하지 않음 즉, 아이디가 존재하지 않는 다는 것임 .
       }catch(Exception e){
           e.printStackTrace();
       }
       return -2;  // database Error
    }


    // 이 로그인 함수를 수행하고 , 사용자에게 로그인 결과를 알려주는 페이지가 필요 한데,
    // 그게 로그인 엑션 페이지 임 ,


}
