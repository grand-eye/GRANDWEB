package com.grand.admin.file.vo;

import com.grand.admin.common.vo.CommonVO;

import lombok.Data;

@Data
public class FileVO extends CommonVO {
    private int idx;
    private String idxArry;								
    private String cateCode;
    private String cateCode1;
    private String cateCode2;
    private String cateCode3;
    private String cateCode4;
    private String cateNm;								
    private String filePath;								
    private String fileExt;								
    private String fileSize;								
    private String modDt;
    private String fileetc;
    private String search_txt;
    private String groupCode;
    private String fileIdxs;
    private String fileName;
    private String orgName;
    private String orderNum;
    private String delYn;
    private String pidx;
    private String etcTxt;
    private String extCode;
    private String search_org_name;
    private String search_cate_code;
    private String search_etc_txt;
    private String subCateCode;
    private String subCateNm;    
    private String imageTags;
    private String fileKey;
    private String search_sub_cate_code;
    private String search_images_tag;
    
    private String[] fileKeyArray;
    private String fileEtc;
    
}
