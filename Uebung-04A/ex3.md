# Aufgabe 3: SQL/Relationale Algebra

## 3.1 Selektion

$$\sigma_{\text{Rang}=\text{'C4'}}(\text{Professoren})$$

```sql
select * from professoren where rang = 'C4';
```

## 3.2 Projektion

$$\Pi_{\text{PersNr},\text{Name}}(\text{Professoren})$$

```sql
select persnr, name from professoren;
```

$$\Pi_{\text{PersNr},\text{Name}}(\text{Assistenten})$$

```sql
select persnr, name from assistenten;
```

## 3.3 Kreuzprodukt

$$\text{professoren} =\bowtie \text{vorlesungen}$$

```sql
select * from professoren
left outer join vorlesungen on professoren.persnr = vorlesungen.gelesenVon;
```

$$\text{professoren} \bowtie \text{vorlesungen}$$

```sql
select * from professoren
inner join vorlesungen on professoren.persnr = vorlesungen.gelesenVon;
```

## 3.4 Verbund

$$
\Pi_{\text{vl.titel}\rho_{\text{vorgaenger}\leftarrow\text{vl.titel}},(\Pi_{\text{titel}}\sigma_{\text{vorlnr}=\text{va.nachfolger}}(\text{vorlesungen}))} \\
\rho_{\text{va}\leftarrow\text{voraussetzen},\text{vl}\leftarrow\text{vorlesungen}} \\
\sigma_{\text{vl.sws}=4 \land \text{vl.vorlnr}=\text{va.vorgaenger}}
$$

```sql
select vl.titel as vorgaenger,
    (select titel from vorlesung where vorlnr = va.nachfolger) as nachfolger
from voraussetzen as va, vorlesungen as vl
where vl.sws = 4 and vl.vorlnr = va.vorgaenger
```
