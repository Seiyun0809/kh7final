package com.kh.finalteam1.entity.content;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class YesSeriesDto {
	private int contentNo;
	private int contentSeason;
	private int contentEpisode;
	private String episodeInfo;
	private Date contentPlaytime;
	private String seriesPath;
}
