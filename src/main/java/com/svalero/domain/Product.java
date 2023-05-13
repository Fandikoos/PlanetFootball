package com.svalero.domain;

import lombok.*;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Product {
    private int id;

    @NonNull
    private String category;

    @NonNull
    private String name;

    @NonNull
    private int price;

    @NonNull
    private String model;

    @NonNull
    private String color;

    @NonNull
    private String image;
}
