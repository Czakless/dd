public abstract class Konto implements OperacjeBankowe {
    protected String numerKonta;
    protected int pin;
    protected double saldo;
    protected String wlasciciel;

    public Konto(String numerKonta, int pin, double saldo, String wlasciciel) {
        this.numerKonta = numerKonta;
        this.pin = pin;
        this.saldo = saldo;
        this.wlasciciel = wlasciciel;
    }

    public String getNumerKonta() {
        return numerKonta;
    }

    public boolean sprawdzPin(int pin) {
        return this.pin == pin;
    }

    @Override
    public void wplata(double kwota) {
        saldo += kwota;
        System.out.println("Wpłacono: " + kwota + " PLN");
    }

    @Override
    public void wyplata(double kwota) {
        if (kwota <= saldo) {
            saldo -= kwota;
            System.out.println("Wypłacono: " + kwota + " PLN");
        } else {
            System.out.println("Brak wystarczających środków!");
        }
    }

    @Override
    public void pokazSaldo() {
        System.out.println("Saldo: " + saldo + " PLN");
    }

    public String getWlasciciel() {
        return wlasciciel;
    }
}
