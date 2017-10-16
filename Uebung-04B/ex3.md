# Aufgabe 3: SQL/Relationale Algebra

## 3.1 Umbenennung

$$\Pi_{\text{persnr},\text{name}}\rho_{\text{nr}\leftarrow{\text{persnr}},\text{p}\leftarrow\text{professoren}}(\text{professoren})$$

```sql
select persnr as nr, name from professoren as p;
```

$$\Pi_{\text{persnr},\text{name}}\rho_{\text{nr}\leftarrow{\text{persnr}},\text{a}\leftarrow\text{assistenten}}(\text{professoren})$$

```sql
select persnr as nr, name from assistenten as a;
```

## 3.2 Vereinigung

$$\Pi_{\text{nr},\text{name}}[\Pi_{\text{persnr},\text{name}}\rho_{\text{nr}\leftarrow\text{persnr}}(\text{professoren}\cup\text{assistenten})]$$

```sql
select nr, name from (
    select persnr as nr, name from professoren
    union
    select persnr as nr, name from assistenten
) as mitarbeiter;
```

## 3.3 Schnittmenge

$$\Pi_{\text{nr},\text{name}}[\Pi_{\text{persnr},\text{name}}\rho_{\text{nr}\leftarrow\text{persnr}}(\text{professoren}\cup\text{assistenten})]\sigma_{\text{name}\in[\Pi_{\text{name}}(\text{professoren})\land\Pi_{\text{name}}(\text{assistenten})]}$$

```sql
select name from (
    select persnr as nr, name from professoren
    union
    select persnr as nr, name from assistenten
) as mitarbeiter
where name in (select name from professoren)
    and name in (select name from assistenten);
```

## 3.4 Differenz

$$\Pi_{\text{name}}\sigma_{\text{name}\notin[\Pi_{\text{name}}(\text{studenten})]}(\text{assistenten})$$

```sql
select name from assistenten
where name not in (select name from studenten);
```

## 3.5 Division

$$\Pi_{\text{matrnr},\text{count(hoeren.vorlnr)}}(\text{hoeren})\Gamma_{\text{matrnr}}\sigma_{\text{count(vorlnr)}=[Pi_{\text{count(vorlnr)}(\text{vorlesungen})}]}$$

```sql
select matrnr, count(hoeren.vorlnr)
from hoeren
group by matrnr
having count(vorlnr) = (select count(vorlnr) from vorlesungen)
```

(Da es in der relationalen Algebra kein Equivalent zu `GROUP BY` zu geben
scheint, habe ich $\Gamma$ dafür verwendet.)
