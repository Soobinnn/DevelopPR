package com.DevelopPR.community.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.DevelopPR.community.model.dto.CommunityVO;

public class CoValidator implements Validator{
  @Override
  public boolean supports(Class<?> clazz) {
      return CommunityVO.class.equals(clazz);
  }

@Override
public void validate(Object target, Errors errors) {
	CommunityVO vo = (CommunityVO) target;
    if(vo.getContent().length()<1) {
    	errors.rejectValue("content", "글 내용을 입력해주세요.");
    }
	if(vo.getContent().contentEquals("")) {
		errors.rejectValue("content", "글 내용을 입력해주세요.");
	}
	
   } //end of validate

  }  //end of CoValidator
