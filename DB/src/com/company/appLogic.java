package com.company;

import java.util.InputMismatchException;
import java.util.Scanner;

public class appLogic {
    public static void start() {
        welcome();
        int choice = choice();
        organizer(choice);

    }
    public static void welcome(){
        System.out.println("""

                   Hey! Welcome to the app! \s
                -----------------------------
                What do you want to do today?
                1, Search for order history of customers.
                2, Search for product Lines or categories to buy.
                3, Change Employee's job title.""");
        System.out.print("Enter choice: ");
    }
    public static int choice(){

        try {
            Scanner scanner = new Scanner(System.in);
            return scanner.nextInt();
        } catch (InputMismatchException e){
            System.out.println("Please Enter a valid number of choice!");
            return choice();
        } catch (Exception e){
            System.out.println("Something went wrong!");
            return choice();
        }
    }
    public static void organizer(int choice){
        DB_connection myConnection = new DB_connection();
        myConnection.connect();
        switch (choice) {
            case 1 -> {
                System.out.print("Enter customerNumber: ");
                int customer_number = choice();
                myConnection.searchForOrderHistory(customer_number);
            }
            case 2 -> {
                System.out.print("Enter product Line/category: ");
                String product = choiceString();
                myConnection.searchProductCatagories(product);
            }
            case 3 -> {
                System.out.print("Enter Employee id: ");
                int id = choice();
                System.out.print("Enter new job title: ");
                String title = choiceString();
                myConnection.change_employees_job_title(id, title);
            }
            default -> System.out.println("Choice out of range!");
        }
        myConnection.disconnect();

    }

    public static String choiceString(){
        try {
            Scanner scanner = new Scanner(System.in);
            return scanner.nextLine();
        }  catch (InputMismatchException e){
            System.out.println("Please Enter a valid number of choice!");
            return choiceString();
        } catch (Exception e){
            System.out.println("Something went wrong!");
            return choiceString();
        }
    }
}
