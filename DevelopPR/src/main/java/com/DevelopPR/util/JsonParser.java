package com.DevelopPR.util;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.DevelopPR.user.dto.UserVO;

public class JsonParser 
{
	// 네이버 json 파싱
	
	JSONParser jsonParser = new JSONParser();

	public UserVO changeJson(String string) throws Exception 
	{

		HashMap<String, Object> map = new HashMap<>();
		JSONParser jsonParser = new JSONParser();
		UserVO vo = new UserVO();

		JSONObject jsonObject = (JSONObject) jsonParser.parse(string);

		jsonObject = (JSONObject) jsonObject.get("response");

		map.put("userName", jsonObject.get("name"));
		map.put("profile", jsonObject.get("profile_image"));
		map.put("userNick", jsonObject.get("id"));
		map.put("userEmail", jsonObject.get("email"));
		
		vo.setUserName(map.get("userName").toString());
		vo.setProfile(map.get("profile").toString()); 
		vo.setUserNick(map.get("userNick").toString()); 
		vo.setUserEmail(map.get("userEmail").toString()); 
	
		return vo;
	}
}
