package com.grand.util.common;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ser.DefaultSerializerProvider;

public class GrandCustomObjectMapper extends ObjectMapper{

	private static final long serialVersionUID = 1L;
	
	public GrandCustomObjectMapper() {
		DefaultSerializerProvider.Impl sp = new DefaultSerializerProvider.Impl();
		sp.setNullValueSerializer( new NullSerializer());
		this.setSerializerProvider(sp);
	}
}
