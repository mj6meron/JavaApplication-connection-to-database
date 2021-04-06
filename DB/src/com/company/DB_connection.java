package com.company;
import java.sql.*;

public class DB_connection {
    String url = "jdbc:mysql://127.0.0.1:3306/classicmodels?user=root&password=root";
    Connection connection;
    PreparedStatement ps;
    ResultSet resultSet;
    public void connect() {
        try{
            connection = DriverManager.getConnection(url);
        }
         catch (SQLException ex){
             System.out.println("connection failed!");
        }
    }


    public void searchForOrderHistory(int CustomerNumber){
        try{
            ps = connection.prepareStatement("SELECT * FROM orders WHERE customerNumber= ?");
            ps.setInt(1, CustomerNumber);
            resultSet = ps.executeQuery();

            if (!resultSet.next()){
                System.out.println("Customer not found!");
            } else {
                System.out.println("-----------------------------");
                while(resultSet.next()){
                    System.out.println(
                        "Order Number: " + resultSet.getInt(1)+
                        "\nOrder Date: " + resultSet.getDate(2)+
                        "\nRequired Date: " + resultSet.getDate(3)+
                        "\nShipped Date: " + resultSet.getDate(4)+
                        "\nstatus: " + resultSet.getString(5)+
                        "\n-----------------------------");}
            }
        }catch(SQLException ex){
            System.out.println("Error on executing statement!");
            ex.printStackTrace();
        }
    }


    public void searchProductCatagories(String ProductLine){
        try{
            ps = connection.prepareStatement("SELECT * FROM products WHERE ProductLine= ?");
            ps.setString(1, ProductLine);
            resultSet = ps.executeQuery();
            if (!resultSet.next()){
                System.out.println("Product category not found!");
            } else {
                System.out.println();
                System.out.println("*******  "+ resultSet.getString(3) +"  *******");
                System.out.println("-----------------------------");
                while(resultSet.next()){
                    System.out.println(
                        "Product Name: " + resultSet.getString(2)+
                        "\nQuantity in stock: " + resultSet.getInt(7)+
                        "\nPrice : " + resultSet.getDouble(8)+
                        " USD\n-----------------------------");}
            }
        }catch(SQLException ex){
            System.out.println("Error on executing statement!");
        }
    }


    public void change_employees_job_title(int employeeNumber, String jobTitle){
        try{
            ps = connection.prepareStatement("SELECT * FROM employees WHERE employeeNumber=?");
            ps.setInt(1, employeeNumber);
            resultSet = ps.executeQuery();
            if (!resultSet.next()){
                System.out.println("\nEmployee not found!");
            } else if (resultSet.getString(8).toLowerCase().equals(jobTitle.toLowerCase())) {
                System.out.println(
                        "\nEmployee : " + resultSet.getString(3)+
                        " " + resultSet.getString(2)+
                        " has already a job title of "  +
                        resultSet.getString(8));
            } else {
                ps = connection.prepareStatement("UPDATE employees SET jobTitle =? WHERE employeeNumber=?");
                ps.setString(1, jobTitle);
                ps.setInt(2, employeeNumber);
                ps.executeUpdate();
                System.out.println("\nEmployee job title Changed!");
                System.out.println("---------------------------");
                System.out.println(
                         "Employee Name: " + resultSet.getString(3)+
                         " " + resultSet.getString(2)+
                         "\nOld Title: " + resultSet.getString(8)+
                         "\nNew Title : " + jobTitle);
            }
        }catch(SQLException ex){
            System.out.println("Error on executing statement!");
        }
    }


    public void disconnect() {
        try{
            if(connection != null){ connection.close();}
            if(ps != null){ ps.close();}
            if(resultSet != null){ resultSet.close();}
        }
        catch (SQLException ex){
            System.out.println("closing the resources failed!");
        }
    }
}
