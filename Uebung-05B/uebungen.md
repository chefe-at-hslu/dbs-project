# Übung DP: Datenbankprogrammierung

## 1. Selbststudium

### Frage 1

Was ist ein Cursor? Definieren Sie das Konzept in Ihren eigenen Worten.

- Ein Cursor ist ein Zeiger, der eine Reihe von Tupeln in einer bestimmten
  Reihenfolge (die physische oder eine durch `ORDER BY` definierte) durchlaufen
  kann.
- Ein Cursor wird mittels `DECLARE`-Anweisung erstellt für ein
  `SELECT`-Statement erzeugt:
    - `DECLARE foo CURSOR FOR SELECT * FROM person ORDER BY AGE DESC;`
- Mittels `OPEN` und `CLOSE` kann ein Cursor geöffnet bzw. geschlossen werden:
    - `OPEN foo`
    - `CLOSE foo`
- Der `FETCH`-Befehl liefert die Tupel zurück, auf die der Cursor gegenwärtig
  verweist, und positioniert den Cursor um eine Tupel weiter.

### Frage 2

Aus welchem  Grund (warum) und zu welchem Zweck (wozu) braucht man Cursors?

- Warum: Die Ergebnisse vom `SELECT`-Statement sind oft zu gross, um sie auf
  einmal an das anfragende Programm zu übertragen.
- Wozu: Mit einem Cursor kann die Ergebnismenge eines `SELECT`-Statements in
  mehreren Schritten zum anfragenden Programm übertragen werden, denn die
  Datenbank weiss "weiss" anhand des Cursors nach der Übertragung eines
  Teilergebnisses, an welcher Stelle er mit der Übertragung fortgefahren werden
  muss.

### Frage 3

Wozu werden Datenbanksprachen in andere Sprachen eingebettet?

- Benutzer, die nicht mit SQL umgehen können, brauchen eine spezielle
  Anwendungssoftware. Anwendungssoftware wird zumeist nicht in SQL, sondern mit
  einer anderen Programmiersprache geschrieben. Diese andere Programmiersprache
  muss eine Möglichkeit haben, SQL-Befehle auf eine Datenbank abzusetzen.
