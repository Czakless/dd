import java.util.Scanner;

public class BankSystem {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        BazaKont baza = new BazaKont();

        System.out.println("=== SYSTEM BANKOWY ===");
        System.out.print("Podaj numer konta: ");
        String numer = sc.nextLine();

        System.out.print("Podaj PIN: ");
        int pin = sc.nextInt(); //

        Konto konto = baza.zaloguj(numer, pin);

        if (konto == null) {
            System.out.println("Niepoprawne dane logowania!");
            return;
        }
        System.out.println("\nWitaj, " + konto.getWlasciciel() + "!");
        int wybor;

        do {
            System.out.println("\n--- MENU ---");
            System.out.println("1. Sprawdź saldo");
            System.out.println("2. Wpłata");
            System.out.println("3. Wypłata");
            if (konto instanceof KontoOszczednosciowe)
                System.out.println("4. Nalicz odsetki");
            System.out.println("0. Wyloguj");

            System.out.print("Wybór: ");
            wybor = sc.nextInt();

            switch (wybor) {
                case 1:
                    konto.pokazSaldo();
                    break;
                case 2:
                    System.out.print("Kwota wpłaty: ");
                    konto.wplata(sc.nextDouble());
                    break;
                case 3:
                    System.out.print("Kwota wypłaty: ");
                    konto.wyplata(sc.nextDouble());
                    break;
                case 4:
                    if (konto instanceof KontoOszczednosciowe) {
                        System.out.print("Podaj procent odsetek: ");
                        ((KontoOszczednosciowe) konto).naliczOdsetki(sc.nextDouble());
                    } else {
                        System.out.println("Niepoprawna opcja.");
                    }
                    break;
                case 0:
                    System.out.println("Wylogowano. Do zobaczenia!");
                    break;
                default:
                    System.out.println("Niepoprawna opcja.");
            }
        } while (wybor != 0);

        sc.close();
    }
}
