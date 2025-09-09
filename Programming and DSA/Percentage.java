public class Percentage {
    public static void main(String[] args) {
        System.out.println("Set the maximum possible score in the game to 500");
        java.util.Scanner sc=new java.util.Scanner(System.in);
        int maxScore= sc.nextInt();
        System.out.println("The actual score of the user");
        int userScore= sc.nextInt();
        System.out.println("Calculating the percentage of the user's score in relation to the maximum available score.\r\n" + //
                        "Convert userScore to float to make sure that the division is accurate:");
        double percentage=(double) userScore/maxScore*100.0;
        System.out.println("User's percentage is "+percentage+'%');                


    }
}
