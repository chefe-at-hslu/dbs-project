# Übung S2: Advanced SQL

## 1. Metadaten

### Frage 1

Beschreiben Sie einen Use Case, in dem Metadaten für Sie notwendig sind, und wo
Sie dann das Data Dictionary verwenden können, um Beschreibungen von Tabellen
und Spalten zu durchsuchen.

- Wenn in eine Applikation mit generischen Operationen wie Einfügen,
  Bearbeiten, Löschen entwickeln möchte, kann ich den Code für den
  Datenbankzugriff oder sogar User Interfaces anhand der Meta-Informationen
  generieren lassen.
- Wenn ich verschiedene Versionen einer Datenbank miteinander vergleichen
  möchte (welche Tabellen/Spalten sind hinzugekommen/weggefallen).
- Wenn ich mittels `psql` oder einem vergleichbaren CLI auf eine mir unbekannte
  Datenbank zugreife und zuerst deren Struktur verstehen muss.

### Frage 2

Welche Tabelle enthält die Spalte Fachgebiet?

```sql
select table_name
from information_schema.columns
where column_name = 'fachgebiet';
```

`assistenten`

### Frage 3

Welche Spalten in der Uni-Datenbank haben den Datentyp Integer?

```sql
select concat(table_name, '.', column_name) as Spalte
from information_schema.columns
where
    table_catalog = 'unidb'
    and table_schema = 'public'
    and data_type like '%int%'
order by Spalte asc
```

    assistenten.boss
    assistenten.persnr
    hoeren.matrnr
    hoeren.vorlnr
    professoren.persnr
    professoren.raum
    pruefen.matrnr
    pruefen.persnr
    pruefen.vorlnr
    studenten.matrnr
    studenten.semester
    voraussetzen.nachfolger
    voraussetzen.vorgänger
    vorlesungen.gelesenvon
    vorlesungen.sws
    vorlesungen.vorlnr

### Frage 4

Welche Tabelle enthält das Information Schema?

```sql
select table_name
from information_schema.tables
where table_schema = 'information_schema'
order by table_name asc;
```

    administrable_role_authorizations
    applicable_roles
    attributes
    character_sets
    check_constraint_routine_usage
    check_constraints
    collation_character_set_applicability
    collations
    column_domain_usage
    column_options
    column_privileges
    columns
    column_udt_usage
    constraint_column_usage
    constraint_table_usage
    data_type_privileges
    domain_constraints
    domains
    domain_udt_usage
    element_types
    enabled_roles
    foreign_data_wrapper_options
    foreign_data_wrappers
    foreign_server_options
    foreign_servers
    foreign_table_options
    foreign_tables
    information_schema_catalog_name
    key_column_usage
    parameters
    _pg_foreign_data_wrappers
    _pg_foreign_servers
    _pg_foreign_table_columns
    _pg_foreign_tables
    _pg_user_mappings
    referential_constraints
    role_column_grants
    role_routine_grants
    role_table_grants
    role_udt_grants
    role_usage_grants
    routine_privileges
    routines
    schemata
    sequences
    sql_features
    sql_implementation_info
    sql_languages
    sql_packages
    sql_parts
    sql_sizing
    sql_sizing_profiles
    table_constraints
    table_privileges
    tables
    transforms
    triggered_update_columns
    triggers
    udt_privileges
    usage_privileges
    user_defined_types
    user_mapping_options
    user_mappings
    view_column_usage
    view_routine_usage
    views
    view_table_usage
