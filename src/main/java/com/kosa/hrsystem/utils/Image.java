package com.kosa.hrsystem.utils;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Image {
    private int id;
    private String originImageName;
    private String newImageName;
    private String imagePath;
}
