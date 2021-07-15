package com.kh.finalteam1.entity.content;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ContentDto {
	private int contentNo;
	private int contentName;
	private String contentInfo;
	private int contentLimit;
	private boolean contentSeries;
	private Date contentRelease;
	private String contentLogo;
	private int contentLikes;
	private int contentViews;
	private String contentThumbnail;
}