public class fibonacci {
    public static void main(String[] args)
    {
        int a=0;
        int b=1;
        System.out.println("Enter the number upto which you see fibonacci number:");
        java.util.Scanner sc=new java.util.Scanner(System.in);
        int n=sc.nextInt();
        System.out.println(a);
        System.out.println(b);
        for(int i=1;i<=n;i++)
        {
            int s=b+a;
            a=b;
            b=s;
            System.out.println(s);
        }
    }
}
