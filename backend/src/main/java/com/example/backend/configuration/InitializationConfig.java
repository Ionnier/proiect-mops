package com.example.backend.configuration;

import com.example.backend.models.*;
import com.example.backend.models.dtos.SignupRequest;
import com.example.backend.repositories.*;
import com.example.backend.services.AuthenticationService;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.StringUtils;
import java.util.Calendar;

@Configuration
@RequiredArgsConstructor
public class InitializationConfig {
    private final DataSourceProperties dataSourceProperties;
    private final AuthenticationService authenticationService;
    private final UserRepository userRepository;
    private final AuthorRepository authorRepository;
    private final BookRepository bookRepository;
    private final BookInventoryRepository bookInventoryRepository;
    private final DeskRepository deskRepository;

    public static String ADMIN_EMAIL = "admin@admin.com";
    public static String ADMIN_PASSWORD = "adminpassword";

    @Bean
    public CommandLineRunner dataLoader() {
        return args -> {

            String dataSourceUrl = dataSourceProperties.determineUrl();

            if (!StringUtils.hasText(dataSourceUrl) && !dataSourceUrl.contains("mem") && !dataSourceUrl.contains("h2")) {
                return;
            }

            authenticationService.signUp(new SignupRequest(ADMIN_EMAIL, ADMIN_PASSWORD, "admin", "admin", "admin", "admin address"));
            User user = userRepository.findByEmail(ADMIN_EMAIL);
            user.isAdmin = true;
            userRepository.save(user);

            Author author1 = authorRepository.save(new Author(null, "J.K. Rowling"));
            Author author2 = authorRepository.save(new Author(null, "George R.R. Martin"));
            Author author3 = authorRepository.save(new Author(null, "Jane Austen"));
            Author author4 = authorRepository.save(new Author(null, "Ernest Hemingway"));

            bookRepository.save(new Book(null, "Harry Potter and the Sorcerer's Stone", "Fantasy", getDate(1997, 6, 26), author1));
            bookRepository.save(new Book(null, "A Game of Thrones", "Fantasy", getDate(1996, 8, 6), author2));
            bookRepository.save(new Book(null, "Pride and Prejudice", "Romance", getDate(1813, 1, 28), author3));
            Book book4 = bookRepository.save(new Book(null, "The Old Man and the Sea", "Fiction", getDate(1952, 9, 1), author4));
            bookInventoryRepository.save(new BookInventory(null, "", book4));

            for (int i = 1; i <= 9; i++) {
                deskRepository.save(new Desk());
            }
        };
    }

    public static Long getDate(int year, int month, int day) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month, day);
        return calendar.getTimeInMillis();
    }
}
