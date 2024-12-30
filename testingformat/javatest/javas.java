public class Main {
    public static void main(String[] args) {
        int num1 = 10; // integer
        double num2 = 3.14; // double
        boolean isAdmin = true; // boolean
        String name = "John Doe"; // string

        int result = num1 + (int)num2; // arithmetic operation with casting
        boolean isEqual = num1 == 10; // equality comparison
        boolean isNotEqual = num1 != 20; // inequality comparison

        if (isAdmin) {
            System.out.println("User is an administrator");
        } else {
            System.out.println("User is not an administrator");
        }

        for (int i = 0; i < 5; i++) {
            System.out.println("Loop iteration " + i);
        }

        System.out.println("Hello, " + name + "!"); // concatenation
    }

    public static int sum(int a, int b) {
        return a + b;
    }
}

