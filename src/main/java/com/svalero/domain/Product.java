package com.svalero.domain;

import lombok.NonNull;

public class Product {
    private int id_product;

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
