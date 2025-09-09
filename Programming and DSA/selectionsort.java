public class selectionsort
{
    public static void main(String[] args)
    {
        System.out.println("Enter the length of the array:");
        java.util.Scanner rafid=new java.util.Scanner(System.in);
        int n=rafid.nextInt();
        int  a[]= new int[n];
        System.out.println("Enter elements of the array:");

        for (int i=0;i<n;i++)
        {
            a[i]=rafid.nextInt();
        }
        for(int i=0;i<n-1;i++)
        {
            int minind=i;
            for (int j=i+1;j<n;j++)
            {
                if (a[minind]>a[j])
                {
                    minind=j;
                }
            }
            int temp=a[i];
            a[i]=a[minind];
            a[minind]=temp;
        }
    System.out.println("Sorted array is:");    
    for (int i=0;i<n;i++)
    {
        System.out.println(a[i]);
    }    

    }

}