package com.example.backend.controller;

import com.example.backend.BaseTestClass;
import com.example.backend.configuration.InitializationConfig;
import com.example.backend.models.BookInventory;
import com.example.backend.models.BookRentalState;
import com.example.backend.models.dtos.RentBookRequest;
import com.example.backend.models.dtos.ReviewRequest;
import com.example.backend.utils.AuthenticationTestUtils;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import java.nio.charset.StandardCharsets;
import java.util.Calendar;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class BookControllerTests extends BaseTestClass {
    @Autowired
    AuthenticationTestUtils authenticationTestUtils;

    @Test
    public void getAllBooks() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .get("/api/books")
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
    }

    @Test
    public void getAllBooksAsAnonymous() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .get("/api/books")
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isForbidden());
    }

    @Test
    public void rentBook() throws Exception {
        bookInventoryRepository.save(new BookInventory(null, "", bookRepository.findById(1L).stream().iterator().next()));
        RentBookRequest rentBookRequest = new RentBookRequest(1L, InitializationConfig.getDate(currentYear, currentMonth, currentDay + 1), 5L);

        mvc.perform(MockMvcRequestBuilders
                        .post("/api/books")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .content(objectMapper.writeValueAsString(rentBookRequest))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isCreated());
    }

    @Test
    public void rentSameBook() throws Exception {
        rentBook();
        RentBookRequest rentBookRequest = new RentBookRequest(1L, InitializationConfig.getDate(currentYear, currentMonth, currentDay + 1), 5L);
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/books")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .content(objectMapper.writeValueAsString(rentBookRequest))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound());
    }

    @Test
    public void rentBookNoInventory() throws Exception {
        RentBookRequest rentBookRequest = new RentBookRequest(1L, InitializationConfig.getDate(currentYear, currentMonth, currentDay + 1), 5L);
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/books")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .content(objectMapper.writeValueAsString(rentBookRequest))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound());
    }

    @Test
    public void rentSameBookMultipleInventories() throws Exception {
        rentBook();
        bookInventoryRepository.save(new BookInventory(null, "", bookRepository.findById(1L).stream().iterator().next()));
        RentBookRequest rentBookRequest = new RentBookRequest(1L, InitializationConfig.getDate(currentYear, currentMonth, currentDay + 1), 5L);
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/books")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .content(objectMapper.writeValueAsString(rentBookRequest))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isCreated());
    }

    @Test
    public void rentBookJustBeforeAfterFirstOne() throws Exception {
        rentBook();
        RentBookRequest rentBookRequest = new RentBookRequest(1L, InitializationConfig.getDate(currentYear, currentMonth, currentDay + 5), 2L);
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/books")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .content(objectMapper.writeValueAsString(rentBookRequest))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound());
    }

    @Test
    public void rentBookJustAfterFirstOne() throws Exception {
        rentBook();
        RentBookRequest rentBookRequest = new RentBookRequest(1L, InitializationConfig.getDate(currentYear, currentMonth, currentDay + 6), 2L);
        System.out.println(objectMapper.writeValueAsString(rentBookRequest));
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/books")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .content(objectMapper.writeValueAsString(rentBookRequest))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isCreated());
    }


    int currentYear = Calendar.getInstance().get(Calendar.YEAR);
    int currentMonth = Calendar.getInstance().get(Calendar.MONTH);
    int currentDay = Calendar.getInstance().get(Calendar.DAY_OF_MONTH);

    // BEGIN TDD
    // Scop: Am posibilitatea de adaugare a unei recenzii pentru o carte
    // Date de intrare: minim id-ul carti si continutul in sine ca String
    final ReviewRequest validReviewRequest = new ReviewRequest(1L, "New content");
    // Pentru a economisii din timp, scriu in acelasi timp si body-ul request-ului, pentru a fi folosit si in test si in dezvoltare


    @Test
    void testAddReview() throws Exception {
        if (rentedBookRepository.count() == 0){
            rentBook();
            rentedBookRepository.findAll().stream().peek(e -> e.state = BookRentalState.RETURNED).forEach(e -> rentedBookRepository.save(e));
        }
        mvc.perform(MockMvcRequestBuilders
                        // Definim endpoint-ul
                        .post("/api/books/reviews")
                        // Definim faptul ca trebuie sa fim autentificat
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .characterEncoding(StandardCharsets.UTF_8)
                        // Definim datele de intrare
                        .content(objectMapper.writeValueAsString(validReviewRequest))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                // Asteptam ca pe raspuns sa primim statutul de created
                .andExpect(status().isCreated());
    }

    // Dupa definirea metodei, adaugam in mockserver functionalitatea dorita, adica ce date sunt necesare pentru intrare, endpoint-ul si raspunsul primit.

    // Testul pica, desi este functionalitate la care ne asteptam sa functioneze
    // Dupa definirea testului incepem implementarea
    // Definirea endpoint-ului -> definim metoda nou in controllerul de Books
    // Definirea autentificarii -> modificam metoda nou creata si in SecuritConfig
    // Definirea datelor de intrare -> modificam metoda pentru a accepta date de intrare

    // Dupa definirea acestora, testul tot nu functioneaza intrucat nu are functionalitate
    // Definim entitate de [Review] pentru baza de date si accesul la baza de date in ReviewRepository

    // Apelam repository-ul si construim entitatea de Review din datele furnizate la intrare
    // Testul trece

    // Continuam cu cerintele ce trebuie sa le implementam

    // Un utilizator poate posta o singura recenzie per carte
    // Scriem testul

    @Test
    void testDoubleAddReviewIsBadRequst() throws Exception {
        testAddReview();
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/books/reviews")
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .characterEncoding(StandardCharsets.UTF_8)
                        .content(objectMapper.writeValueAsString(validReviewRequest))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                // Modificam raspunsul sa primim BadRequest
                .andExpect(status().isBadRequest());
    }

    // Observam ca testul acesta nu trece
    // Nu exista nicio restrictie in modul de creare al unei recenzii, trebuie sa adaugam cod pentru asta
    // Adaugam cod
    // Rulam toate testele din nou sa fim siguri ca toate functionallitatile sunt verificate
    // Observam ca testele merg


    // Continuam cu mai multe cerinte
    // Recenziile pot fi scrise doar de persoane care au avut cel putin o imprumutare completa
    // Scriem test pentru asta

    @Test
    void testReviewUnrentedBook() throws Exception {
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/books/reviews")
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .characterEncoding(StandardCharsets.UTF_8)
                        .content(objectMapper.writeValueAsString(validReviewRequest))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                // Modificam raspunsul sa primim BadRequest
                .andExpect(status().isBadRequest());
    }

    // Observam ca testul nu functioneaza
    // Scriem cod pentru a-l face sa treaca

    // Observam ca dupa ce scriem testele pentru testul anterior, un test deja scris ne creeaza erori,
    // cel simplu de add test pentru ca functionalitatea nu este scrisa
    // modificam testul anterior pentru a-l face sa treaca

    // Continuam in acelasi stil pana cand toate functionalitatile pe care user story-ul trebuie sa le acopere sunt complete

    @Test
    void testReviewRentInProgress() throws Exception {
        if (rentedBookRepository.count() == 0){
            rentBook();
        }
        mvc.perform(MockMvcRequestBuilders
                .post("/api/books/reviews")
                .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                .characterEncoding(StandardCharsets.UTF_8)
                .content(objectMapper.writeValueAsString(validReviewRequest))
                .contentType(MediaType.APPLICATION_JSON)
                .accept(MediaType.APPLICATION_JSON))
        .andExpect(status().isBadRequest());
    }

    @Test
    void testValidateBookId() throws Exception {
        if (rentedBookRepository.count() == 0){
            rentBook();
        }
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/books/reviews")
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .characterEncoding(StandardCharsets.UTF_8)
                        .content(objectMapper.writeValueAsString(validReviewRequest.toBuilder().bookId(null).build()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isBadRequest());
    }

    @Test
    void testValidateContent() throws Exception {
        if (rentedBookRepository.count() == 0){
            rentBook();
        }
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/books/reviews")
                        .header(authenticationTestUtils.authorization, authenticationTestUtils.user())
                        .characterEncoding(StandardCharsets.UTF_8)
                        .content(objectMapper.writeValueAsString(validReviewRequest.toBuilder().content(null).build()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isBadRequest());
    }

    @Test
    void testValidateUser() throws Exception {
        if (rentedBookRepository.count() == 0){
            rentBook();
        }
        mvc.perform(MockMvcRequestBuilders
                        .post("/api/books/reviews")
                        .characterEncoding(StandardCharsets.UTF_8)
                        .content(objectMapper.writeValueAsString(validReviewRequest.toBuilder().content(null).build()))
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isForbidden());
    }
    // END TDD
}
