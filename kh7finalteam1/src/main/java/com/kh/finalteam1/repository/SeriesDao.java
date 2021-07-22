package com.kh.finalteam1.repository;

import com.kh.finalteam1.entity.NoSeriesDto;
import com.kh.finalteam1.entity.YesSeriesDto;

public interface SeriesDao {
	void yesInsert(YesSeriesDto yesSeriesDto);
	void noInsert(NoSeriesDto noSeriesDto);
	NoSeriesDto noGet(int contentNo);
	boolean noEdit(NoSeriesDto noSeriesDto);
}
