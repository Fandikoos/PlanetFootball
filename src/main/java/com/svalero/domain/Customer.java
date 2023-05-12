package com.svalero.domain;

import lombok.*;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Customer {

    private int id_customer;

    @NonNull
    private String name;

    @NonNull
    private String surname;

    @NonNull
    private String telephone;
}
