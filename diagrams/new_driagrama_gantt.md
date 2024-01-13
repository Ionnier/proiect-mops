```mermaid
gantt
    todayMarker off
    title Proiect MOPS
    dateFormat  YYYY-MM-DDH HH:MM

    section Backend
    Inregistrare: d1, 2023-11-20 9:00, 8h
    Autentificare: d2, after d1, 5h
    Vizualizare carti: d3, after d2, 6h
    Adaugare autori: d3, after d2, 6h
    Imprumut carti: d4, after d3, 6h
    Adaugare carti: d4, after d3, 6h
    Adaugare recenzie: d5, after d4, 12h
    CRUD inventar: d5, after d4, 6h
    Returnare carte: d5, after d4, 6h
    Istoric imprumuturi: d6, after d5, 12h
    CRUD birouri: d6, after d5, 6h
    Rezervare birou: d7, after d6, 6h


    section Front - User
    Inregistrare: d1, 2023-11-20 9:00, 8h
    Imprumut carti: d4, after d3, 6h
    Vizualizare carti: d3, after d2, 6h
    Autentificare: d2, after d1, 5h
    Cautare: d6, after d5, 6h
    Recenzie: d5, after d4, 6h
    Filtrare: d6, after d5, 6h
    Istoric imprumuturi: d7, after d6, 6h
    Favorite: d6, after d5, 6h
    Rasfoire birouri: d7, after d6, 3h
    Rezervare birou: d8, after d7, 3h


    section Front - Admin
    Autentificare: d2, after d1, 5h
    Adaugare autori: d3, after d2, 6h
    Adaugare carti: d4, after d3, 6h
    CRUD inventar: d5, after d4, 6h
    CRUD birouri: d6, after d5, 6h
```