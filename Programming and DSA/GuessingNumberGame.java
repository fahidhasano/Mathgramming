public class GuessingNumberGame {
    public static void main(String[] args) {
        java.util.Scanner sc= new java.util.Scanner(System.in);
        System.out.println("Enter minimum interval of guessing:");
        int min=sc.nextInt();
        System.out.println("Enter maximum interval of guessing:");
        int max=sc.nextInt();
        System.out.println("Guess a number between "+min+" to "+max+":");
        int guessedNumber=sc.nextInt();
        int randomNumber=min+(int)( Math.random()*(max+1-min));
        if(randomNumber==guessedNumber){
            System.out.println("You win!!");
        }
        else{
                System.out.println("You lose! The correct answer is: "+ randomNumber);
            }
    }
}
