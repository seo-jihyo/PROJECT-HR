package com.kosa.hrsystem.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class ImageDTO {
    private String originImageName;
    private String newImageName;
    private String imagePath;

    public ImageDTO(String originImageName, String newImageName, String imagePath) {
        this.originImageName = originImageName;
        this.newImageName = newImageName;
        this.imagePath = imagePath;
    }

}
